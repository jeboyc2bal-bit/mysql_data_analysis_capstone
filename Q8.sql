-- What percent of total revenue comes from the top category?

use olist;

select * from order_items;
select * from products;

with category_revenue as (
    select
        p.product_category_name,
        sum(oi.price) as category_total
    from order_items oi
    join products p on p.product_id = oi.product_id
    group by p.product_category_name
),
revenue_with_total as (
    select
        product_category_name,
        category_total,
        sum(category_total) over () as grand_total,
        round(
            category_total / sum(category_total) over () * 100
        , 2) as percent_of_total
    from category_revenue
)
select
    product_category_name,
    category_total,
    grand_total,
    percent_of_total
from revenue_with_total
order by percent_of_total desc
limit 1;
