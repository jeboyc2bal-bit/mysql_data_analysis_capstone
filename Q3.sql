-- What is the month-over-month change in revenue?
-- Using the previous Monthly revenue Trend for the MOM (Month-over-month) change
use olist;
select * from orders;
select * from order_items;

with monthly_revenue as (
    select
        data_format(opt.order_purchase_timestamp, '%Y-%m-01') as month,
        sum(p.price) as total_revenue
    from orders opt
    join order_items p on p.order_id = opt.order_id
    group by month
)
select
    month,
    total_revenue,
    lag(total_revenue) over (order by month) as prev_month_revenue,
    total_revenue - lag(total_revenue) over (order by month) as mom_change,
    round(
        (total_revenue - lag(total_revenue) over (order by month))
        / nullif(lag(total_revenue) over (order by month), 0 ) * 100
    , 2) as mom_percent_change
from monthly_revenue
order by month;
