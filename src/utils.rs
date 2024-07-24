use std::io::{BufRead, Error, Write};

pub(super) fn process_line_by_line<R, W, F>(
    reader: R,
    mut writer: W,
    process_line_func: F,
) -> Result<(), Error>
where
    R: BufRead,
    W: Write,
    F: Fn(&str) -> String,
{
    let mut is_first_line = true;

    for line in reader.lines() {
        let line = line?;

        // Input is read line by line. Make sure newlines are reintroduced to output.
        if is_first_line {
            is_first_line = false;
        } else {
            writer.write("\n".as_bytes())?;
        }

        writer.write(process_line_func(line.as_str()).as_bytes())?;
        writer.flush()?;
    }

    Ok(())
}

#[cfg(test)]
mod tests {

    use super::*;
    use std::io;

    fn return_same(input: &str) -> String {
        input.to_owned()
    }

    #[test]
    fn process_line_by_line_processes_all_lines() {
        let query_input = "dit
            is
            de echte input right?";

        let input = io::Cursor::new(&query_input);
        let mut output = Vec::new();
        process_line_by_line(input, &mut output, return_same).unwrap();

        assert_eq!(output, query_input.as_bytes());
    }
}
