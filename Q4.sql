-- Which product categories generate the most revenue?
use olist;
select * from orders;
select * from products;

select
    p.product_category_name,
    sum(oi.price) as total_revenue,
    count(distinct oi.order_id) as order_count,
    count(oi.order_item_id) as items_sold
from order_items oi
join products p on p.product_id = oi.product_id
group by p.product_category_name
order by total_revenue desc;
