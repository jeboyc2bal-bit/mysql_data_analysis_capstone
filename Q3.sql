-- What is the month-over-month change in revenue?
-- Using the previous Monthly revenue Trend for the MOM (Month-over-month) change
select * from orders;
select * from order_items;

WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(opt.order_purchase_timestamp, '%Y-%m-01') AS month,
        SUM(p.price) AS total_revenue
    FROM orders opt
    JOIN order_items p ON p.order_id = opt.order_id
    GROUP BY month
)
SELECT
    month,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY month) AS prev_month_revenue,
    total_revenue - LAG(total_revenue) OVER (ORDER BY month) AS mom_change,
    ROUND(
        (total_revenue - LAG(total_revenue) OVER (ORDER BY month))
        / nullif(LAG(total_revenue) OVER (ORDER BY month), 0 ) * 100
    , 2) AS mom_percent_change
FROM monthly_revenue
ORDER BY month;