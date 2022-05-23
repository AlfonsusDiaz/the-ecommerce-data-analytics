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

![Return Product](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAcQAAABeCAMAAACKC5S8AAAAYFBMVEUAAAAbQ33JIDXpgSsxTYDHHzNvmaUcRH0bQ38bQ30cRHxbiJvskS0bQ34cQ33rkS1ul6fpdS1abZJZZZFZZZEiSYHJHzVZh5tacZXJIDXskS1wmaZaZZEcRH5Zh5vpdi0aehpOAAAAGXRSTlMA58A+F0CBvkKCZcDAn89/P8BAwYAwfoBm00FwiwAABOBJREFUeF7s211rhDAQRuGAQ1w/YGctpSVR+///ZTW5MNAstLTrRnvO3Xv9IAxIzM+y3ltTWLQ/IoFIIBKIIBKIBCKJxlZEjYkpOro653qTpP5L1iTNS515bAQiiGJjnfedjemhEEHMHzYggkgg7hWIBCKBCCKIl5CAeOSm0OV8iKIqIBZctRUQk52Fk2ErICZbQHxKlbvf1WR6m+83gJgLRBBBbNbasyP2SW4pmVnE924ryCVbC/2waq7T2AOu06Zea4+MCGI9rTUgfisQQaxCh0YE8faxdPs3iCCCCCKIIIIIIoiv4TcGiPun1uofIb6M4ziA+Mz3Tr9H/GTnbpvahmE4gNsgJsk7e49mcJtu3/9brrRDTXAbP9I2XP7v4Kqi5Oec3cTl8ohAL4krQ9TG6V0Q77/sUoP4a5enyyJGPlRZ7wyrUA4R6Fg2BBGcD7KLRQeFcA7tawXJPuZ0HL+EprW8j/6E6FLENHlEzSURycoxFksRp1ViuRsRePqOvoAxYtq4FJ+WGToEdoR+rYjgJUkeMU2IfYhkZRbrTCZOkjQjMrO3ZGmdiBBkDKLYmEWsE8koehmIiJEdOuZ1IqKMQhQL7YgkUqnIMhSR2NtYgng/zQFx9qsmRMZ57P8ZYh6XPxVaW4FoZ0WhGREmb4KYGxVKoBWhF5E9Ezsb84g7t6V8O7GH8QXxaXHvIkpJOHPygtPFRTGidYeOotdLpxURdX0E0/nRm7OxMmsCnO1ChIDkrD/9Re6vjYg//6T5Ph6R5e3ZAixFxHRRYtsQ9bIK8GamhuIKY7gH0YBDT2aViCdGPDcg6jmlNkSfiEDm0sakwlAHoiZF1K1qt4pIOvf0ISoDtyHatA1cbkP0Sh2LuMI5kXW89yHqlROaEEl7TFpbrvBmLOIK79joAIB+RBNknwZEBQvpIlviYoW+4YZoTS+ilgm0IHo5G1pEhA3xdS7CgYjUgojViF4BNkQZh0jvg8gLFStB3K5EdxuIj3e71CDiLnzJOTFceU7UqTmTK86Jd8+71CDqCVrV6hT7V6dQjUhDEdM9NitAvJnPiU7bSHKdz4mafkTNWMT0OLAfkXvu2MD5O6+ZCtgQ9d6p60WMffdOgw6BuqMULEdMXs8fBZFFFXsQY+dTDHd6LQou+zjRQyGiT+bdQ89h/Yj6PBFJj7YQUR8nGuh/nqhtwLE18ktdhGQrjiu52xrgjSqvGDHd2mKRmTFUPdkPyJxsB2hBJHlN4H0wZLqIokHPfNwOkBkngfSx6T7wARCNH7fHJkAzonHVXTg5new4seh1rAqbLsT7fa6OaHw/ohq2IxrOdFGsWPV6bzoQNddHNM4OQWQYuO9Uuyiu0NQcKJuPgmjAJ0eHtFiRKahG1PVR3f5hYFtVAr6mZ3g4Zo84+RlOFtAxh+n3GBiDmP8ShC5wCv5knFU4GPRdDJxweDL5EKMWoHeQP9DD60O+54fn83ks3wmbOfTMN0dqA/Ujprii/EgiOWYmgt428rk5xO0f9G2I750N8V97d5OCQAwDYLSI4M+yjqKQuf81rbQLwZWLQgPvXeEjkFUi4jSTt9MURIxmckTX+EVERBERMQERERERRbzXLpo6JIso4i1+TY6IiDw+/onYX/gsjefWRbMNJSe+JxARERERRUREREREalMWwxtlOQbs4dwwrgAAAABJRU5ErkJggg==)


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
