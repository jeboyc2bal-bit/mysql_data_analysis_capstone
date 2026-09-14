-- What is the monthly revenue trend across the dataset?
-- Arranged by month Date Arranged to YYYY-MM-DD (as indicated in timestamp)
use olist;
select * from order_items;
select * from orders;
select
    date_format(o.order_purchase_timestamp, '%Y-%m-01') as month,
    sum(oi.price) as total_revenue,
    count(o.order_id) as order_count
from orders o
join order_items oi on oi.order_id = o.order_id
group by month
order by month desc;
