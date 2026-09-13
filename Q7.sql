-- How many customers are repeat buyers vs one-time buyers?

use olist;

select * from customers;
select * from orders;

with customer_orders as (
    select
        c.customer_id,
        count(distinct o.order_id) as order_count
    from customers c
    join orders o on o.customer_id = c.customer_id
    group by c.customer_id
),
buyer_type as (
    select
        customer_id,
        order_count,
        case
            when order_count = 1 then 'One-time buyer'
            when order_count > 1 then 'Repeat buyer'
        end as buyer_category
    from customer_orders
)
select
    buyer_category,
    count(customer_id) as number_of_customers
from buyer_type
group by buyer_category;