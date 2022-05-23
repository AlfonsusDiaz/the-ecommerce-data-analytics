-- Display amount of items based on categories

SELECT p.category, count(p.category) as countItem
FROM `bigquery-public-data.thelook_ecommerce.products` p
join `bigquery-public-data.thelook_ecommerce.order_items` oi
on p.id = oi.product_id
where oi.returned_at is null 
group by category
