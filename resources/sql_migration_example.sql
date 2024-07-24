insert into public.coupon_listings (identifier, title, description_html, meta_title, meta_description, full_description_html, locale)
select identifier, title, description_html, meta_title, meta_description, full_description_html, 'sr-BA',
from coupon_listings
WHERE locale = 'sr-RS';

insert into public.promotions (listing_id, menu_label, menu_order, is_active, locale) listing_id, menu_label, menu_order, is_active, 'sr-BA' from promotions locale = 'sr-RS';

insert into public.groups (identifier, title, meta_title, meta_description, header_description, description_html, locale)
select identifier, title, meta_title, meta_description, header_description, description_html, 'sr-BA'
from groups
WHERE locale = 'sr-RS';

insert into public.subgroups (identifier, title, group_id, meta_title, meta_description, header_description, description_html, locale)
select identifier, title, group_id, meta_title, meta_description, header_description, description_html, 'sr-BA'
from subgroups
WHERE locale = 'sr-RS';

insert into public.stores (identifier, title, logo, alt_text, meta_title, meta_description, faq, description_html, locale)
select identifier, title, logo, alt_text, meta_title, meta_description, faq, description_html, 'sr-BA'
from stores
WHERE locale = 'sr-RS';

insert into public.featured_stores (order_rank, store_id, locale)
select order_rank, store_id, 'sr-BA'
from featured_stores
WHERE locale = 'sr-RS';

insert into public.footer_stores (store_id, locale)
select store_id, 'sr-BA'
from footer_stores
WHERE locale = 'sr-RS';

insert into public.navigation_stores (store_id, order_rank, locale)
select store_id, order_rank, 'sr-BA'
from navigation_stores
WHERE locale = 'sr-RS';

insert into public.testimonials (identifier, reviewer_id, store_id, rating, review_date, locale)
select identifier, reviewer_id, store_id, rating, review_date, 'sr-BA'
from testimonials
WHERE locale = 'sr-RS';

insert into public.vouchers (identifier, heading, discount_percent, howto_html, voucher_code, start_date, expiry_date, store_id, link, uses_code_list, alternate_discount_percent, locale)
select identifier, heading, discount_percent, howto_html, voucher_code, start_date, expiry_date, store_id, link, uses_code_list, alternate_discount_percent, 'sr-BA'
from vouchers
WHERE locale = 'sr-RS';

insert into public.main_groups (group_id, order_rank, locale)
select group_id, order_rank, 'sr-BA'
from main_groups
WHERE locale = 'sr-RS';

insert into public.featured_vouchers (order_rank, listing_id, voucher_id, locale)
select order_rank, listing_id, voucher_id, 'sr-BA'
from featured_vouchers
WHERE locale = 'sr-RS';

insert into public.voucher_planner (identifier, execution_time, listing_id, voucher_id, planned_action, forced_order_rank, locale)
select identifier, execution_time, listing_id, voucher_id, planned_action, forced_order_rank, 'sr-BA'
from voucher_planner
WHERE locale = 'sr-RS';

insert into public.voucher_subgroups (voucher_id, subgroup_id, locale)
select voucher_id, subgroup_id, 'sr-BA'
from voucher_subgroups
WHERE locale = 'sr-RS';

insert into public.voucher_groups (voucher_id, group_id, locale)
select voucher_id, group_id, 'sr-BA'
from voucher_groups
WHERE locale = 'sr-RS';

insert into public.voucher_code_listings (voucher_id, code, locale)
select voucher_id, code, 'sr-BA'
from voucher_code_listings
WHERE locale = 'sr-RS';

insert into public.voucher_images (voucher_id, image, alt_text, locale)
select voucher_id, image, alt_text, 'sr-BA'
from voucher_images
WHERE locale = 'sr-RS';

insert into public.blog_authors (identifier, display_name, link, description_html, avatar_image, hide_link, short_description, full_description_html, locale)
select identifier, display_name, link, description_html, avatar_image, hide_link, short_description, full_description_html, 'sr-BA'
from blog_authors
WHERE locale = 'sr-RS';

insert into public.blog_posts (identifier, title, meta_title, meta_description, created_at, updated_at, thumbnail_image, thumbnail_alt, main_image, author, content_html, locale)
select identifier, title, meta_title, meta_description, created_at, updated_at, thumbnail_image, thumbnail_alt, main_image, author, content_html, 'sr-BA'
from blog_posts
WHERE locale = 'sr-RS';

insert into public.custom_pages (page_id, title, header_description, content_html, meta_title, meta_description, updated_at, locale)
select page_id, title, header_description, content_html, meta_title, meta_description, updated_at, 'sr-BA'
from custom_pages
WHERE locale = 'sr-RS';

insert into public.coupon_listings (identifier, title, description_html, meta_title, meta_description, full_description_html, locale)
select identifier, title, description_html, meta_title, meta_description, full_description_html, 'es-UY'
from coupon_listings
WHERE locale = 'es-MX';

insert into public.promotions (listing_id, menu_label, menu_order, is_active, locale)
select listing_id, menu_label, menu_order, is_active, 'es-UY'
from promotions
WHERE locale = 'es-MX';

insert into public.groups (identifier, title, meta_title, meta_description, header_description, description_html, locale)
select identifier, title, meta_title, meta_description, header_description, description_html, 'es-UY'
from groups
WHERE locale = 'es-MX';

insert into public.subgroups (identifier, title, group_id, meta_title, meta_description, header_description, description_html, locale)
select identifier, title, group_id, meta_title, meta_description, header_description, description_html, 'es-UY'
from subgroups
WHERE locale = 'es-MX';

insert into public.stores (identifier, title, logo, alt_text, meta_title, meta_description, faq, description_html, locale)
select identifier, title, logo, alt_text, meta_title, meta_description, faq, description_html, 'es-UY'
from stores
WHERE locale = 'es-MX';

insert into public.featured_stores (order_rank, store_id, locale)
select order_rank, store_id, 'es-UY'
from featured_stores
WHERE locale = 'es-MX';

insert into public.footer_stores (store_id, locale)
select store_id, 'es-UY'
from footer_stores
WHERE locale = 'es-MX';

insert into public.navigation_stores (store_id, order_rank, locale)
select store_id, order_rank, 'es-UY'
from navigation_stores
WHERE locale = 'es-MX';

insert into public.testimonials (identifier, reviewer_id, store_id, rating, review_date, locale)
select identifier, reviewer_id, store_id, rating, review_date, 'es-UY'
from testimonials
WHERE locale = 'es-MX';

insert into public.vouchers (identifier, heading, discount_percent, howto_html, voucher_code, start_date, expiry_date, store_id, link, uses_code_list, alternate_discount_percent, locale)
select identifier, heading, discount_percent, howto_html, voucher_code, start_date, expiry_date, store_id, link, uses_code_list, alternate_discount_percent, 'es-UY'
from vouchers
WHERE locale = 'es-MX';

insert into public.main_groups (group_id, order_rank, locale)
select group_id, order_rank, 'es-UY'
from main_groups
WHERE locale = 'es-MX';

insert into public.featured_vouchers (order_rank, listing_id, voucher_id, locale)
select order_rank, listing_id, voucher_id, 'es-UY'
from featured_vouchers
WHERE locale = 'es-MX';

insert into public.voucher_planner (identifier, execution_time, listing_id, voucher_id, planned_action, forced_order_rank, locale)
select identifier, execution_time, listing_id, voucher_id, planned_action, forced_order_rank, 'es-UY'
from voucher_planner
WHERE locale = 'es-MX';

insert into public.voucher_subgroups (voucher_id, subgroup_id, locale)
select voucher_id, subgroup_id, 'es-UY'
from voucher_subgroups
WHERE locale = 'es-MX';

insert into public.voucher_groups (voucher_id, group_id, locale)
select voucher_id, group_id, 'es-UY'
from voucher_groups
WHERE locale = 'es-MX';

insert into public.voucher_code_listings (voucher_id, code, locale)
select voucher_id, code, 'es-UY'
from voucher_code_listings
WHERE locale = 'es-MX';

insert into public.voucher_images (voucher_id, image, alt_text, locale)
select voucher_id, image, alt_text, 'es-UY'
from voucher_images
WHERE locale = 'es-MX';

insert into public.blog_authors (identifier, display_name, link, description_html, avatar_image, hide_link, short_description, full_description_html, locale)
select identifier, display_name, link, description_html, avatar_image, hide_link, short_description, full_description_html, 'es-UY'
from blog_authors
WHERE locale = 'es-MX';

insert into public.blog_posts (identifier, title, meta_title, meta_description, created_at, updated_at, thumbnail_image, thumbnail_alt, main_image, author, content_html, locale)
select identifier, title, meta_title, meta_description, created_at, updated_at, thumbnail_image, thumbnail_alt, main_image, author, content_html, 'es-UY'
from blog_posts
WHERE locale = 'es-MX';

insert into public.custom_pages (page_id, title, header_description, content_html, meta_title, meta_description, updated_at, locale)
select page_id, title, header_description, content_html, meta_title, meta_description, updated_at, 'es-UY'
from custom_pages
WHERE locale = 'es-MX';
