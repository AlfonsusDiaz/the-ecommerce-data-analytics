# RevoU Mini Course - Intro to Data Analytics:

This repository is mainly for projects I have done under RevoU Mini Course - Intro to Data Analytics. The question can be seen at this [link](https://docs.google.com/document/d/1tCpo4cUX0bbSuzAgCGxHDasWdT4WYWePkwJFnqmnURU/edit?usp=sharing).



## Step 1 - Data Manipulation Query

```sql
-- Display amount of returned product based on date
select p.category, p.brand, p.name, oi.returned_at
from `bigquery-public-data.thelook_ecommerce.order_items` oi
join `bigquery-public-data.thelook_ecommerce.products` p
on oi.product_id = p.id
where returned_at is not null
order by returned_at asc

-- Display amount of items based on categories
SELECT p.category, count(p.category) as countItem
FROM `bigquery-public-data.thelook_ecommerce.products` p
join `bigquery-public-data.thelook_ecommerce.order_items` oi
on p.id = oi.product_id
where oi.returned_at is null 
group by category

-- Display categories & amount of orders based on gender
select p.category, o.gender, count(o.gender) as countGender 
from `bigquery-public-data.thelook_ecommerce.orders` o
join `bigquery-public-data.thelook_ecommerce.order_items` oi
on o.order_id = oi.order_id
join `bigquery-public-data..thelook_ecommerce.products` p
on p.id = oi.product_id
group by o.gender, p.category
order by o.gender asc
```

## Step 2: Create some visualizations
The picture below is one of the visualization from previous data manipulation process. For the better experience, you can seen on [My Tableau Story](https://public.tableau.com/views/ThelookEcommerceV_1/EcommerceV_1?:language=en-US&:display_count=n&:origin=viz_share_link).

![Return Product](https://drive.google.com/file/d/1SGqtp3GfQfhwaaXioPJvCRjuyPpPe7gs/view?usp=sharing)


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
