use clap::{arg, command, Parser};
use nom::{
    branch::alt,
    bytes::complete::{tag, take_until},
    IResult,
};
use std::io::{stdin, stdout};
use utils::process_line_by_line;

mod utils;

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    #[arg(short, long)]
    source_locale: String,

    #[arg(short, long)]
    target_locale: String,
}

fn main() {
    // Read arguments using Clap defined struct.
    let args = Args::parse();

    // Process stdin line by line, convert each line to expected output, then print line to stdout
    process_line_by_line(stdin().lock(), stdout(), |line| {
        process_with_nom_parser(
            line,
            args.source_locale.as_str(),
            args.target_locale.as_str(),
        )
    })
    .expect("IO should be able to be performed.");
}

fn process_with_nom_parser(input: &str, source_locale: &str, target_locale: &str) -> String {
    // We are going to replace all locale strings. Resulting string should be about the same lenght as input
    let mut result = String::with_capacity(input.len());
    let mut remaining = input;

    while !remaining.is_empty() {
        match try_replace_locale(remaining, source_locale, target_locale) {
            Ok((new_remaining, updated_string)) => {
                // After each detection of replaced locale, add new string to output
                result.push_str(&updated_string);
                remaining = new_remaining;
            }
            Err(_) => {
                // If parser does detect there are no other locales (to be replaced), just add remainder to output
                result.push_str(remaining);
                break;
            }
        }
    }

    result
}

fn try_replace_locale<'a>(
    line: &'a str,
    source_locale: &'a str,
    target_locale: &'a str,
) -> IResult<&'a str, String> {
    alt((
        // try to parse a source locale (located in 'where' of sql statement)
        replace_source_locale(source_locale),
        // try to parse a target locale (located in 'select' of sql statement)
        replace_target_locale(target_locale),
    ))(line)
}

fn replace_source_locale<'a>(
    new_source_locale: &'a str,
) -> impl Fn(&'a str) -> IResult<&'a str, String> {
    move |input: &str| {
        // SQL target: SELECT column_a, ...., 'sr-BA';
        let (input, part_till_locale_shows_up) = take_until(", '")(input)?;
        let (input, opening_characters_locale) = tag(", '")(input)?;
        let (input, _old_source_locale) = take_until("'")(input)?;
        Ok((
            input,
            format!("{part_till_locale_shows_up}{opening_characters_locale}{new_source_locale}"),
        ))
    }
}

fn replace_target_locale<'a>(
    new_target_locale: &'a str,
) -> impl Fn(&'a str) -> IResult<&'a str, String> {
    move |input: &str| {
        // SQL target: WHERE locale = 'some-locale';
        let (input, part_till_locale_shows_up) = take_until("= '")(input)?;
        let (input, opening_characters_locale) = tag("= '")(input)?;
        let (input, _old_source_locale) = take_until("'")(input)?;
        Ok((
            input,
            format!("{part_till_locale_shows_up}{opening_characters_locale}{new_target_locale}"),
        ))
    }
}

#[cfg(test)]
mod tests {

    use super::*;

    #[test]
    fn test_map_replace_source_locale() {
        let parser = replace_source_locale("new-locale");

        let input = "some text, 'old-locale' and more text";
        let expected_output = "some text, 'new-locale";

        match parser(input) {
            Ok((remaining_input, output)) => {
                assert_eq!(remaining_input, "' and more text");
                assert_eq!(output, expected_output);
            }
            Err(error) => {
                panic!("Parsing error: {:?}", error);
            }
        }
    }

    #[test]
    fn test_map_replace_target_locale() {
        let parser = replace_target_locale("new-locale");

        let input = "WHERE column_a = 'old-locale'";
        let expected_output = "WHERE column_a = 'new-locale";

        match parser(input) {
            Ok((remaining_input, output)) => {
                assert_eq!(remaining_input, "'");
                assert_eq!(output, expected_output);
            }
            Err(error) => {
                panic!("Parsing error: {:?}", error);
            }
        }
    }
}
