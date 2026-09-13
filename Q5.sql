-- Rank the top 3 products within each category by revenue.
-- Sorted the categories by Alphabet, where 'null' became "Unknown"

use olist;
select * from products;
select * from order_items;


with product_revenue as (
    select
        coalesce(p.product_category_name, 'Unknown') as product_category_name,
        p.product_id,
        SUM(oi.price) as total_revenue
    from order_items oi
    join products p on p.product_id = oi.product_id
    group by coalesce(p.product_category_name, 'Unknown'), p.product_id
),
ranked_products as (
    select
        product_category_name,
        product_id,
        total_revenue,
        ROW_NUMBER() over (
            partition by product_category_name
            order by total_revenue desc
        ) as rank_in_category
    from product_revenue
)
select
    product_category_name,
    product_id,
    total_revenue,
    rank_in_category
from ranked_products
where rank_in_category <= 3
order by product_category_name, rank_in_category;


