-- What is the monthly revenue trend across the dataset?
-- Arranged by month Date Arranged to YYYY-MM-DD (as indicated in timestamp)

select * from order_items;
select * from orders;
select
    date_format(o.order_purchase_timestamp, '%Y-%m-01') AS month,
    sum(oi.price) AS total_revenue,
    count(o.order_id) AS order_count
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY month
ORDER BY month desc;