-- Display amount of returned product based on date

select p.category, p.brand, p.name, oi.returned_at
from `bigquery-public-data.thelook_ecommerce.order_items` oi
join `bigquery-public-data.thelook_ecommerce.products` p
on oi.product_id = p.id
where returned_at is not null
order by returned_at asc