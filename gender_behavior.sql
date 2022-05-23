-- Display categories & amount of orders based on gender

select p.category, o.gender, count(o.gender) as countGender 
from `bigquery-public-data.thelook_ecommerce.orders` o
join `bigquery-public-data.thelook_ecommerce.order_items` oi
on o.order_id = oi.order_id
join `bigquery-public-data..thelook_ecommerce.products` p
on p.id = oi.product_id
group by o.gender, p.category
order by o.gender asc