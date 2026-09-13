-- Segment customers into spend tiers (Low / Medium / High).

use olist;
select * from customers;
select * from orders;
select * from order_items;

with customer_spend as (
    select
        c.customer_id,
        sum(oi.price) as total_spend
    from customers c
    join orders o on o.customer_id = c.customer_id
    join order_items oi on oi.order_id = o.order_id
    group by c.customer_id
)
select
    customer_id,
    total_spend,
    case
        when total_spend < 100 then 'Low'
        when total_spend between 100 and 500 then 'Medium'
        when total_spend > 500 then 'High'
    end as tier
from customer_spend
order by total_spend desc;