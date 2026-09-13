# Olist SQL Analysis

## Overview
This project analyzes the Olist e-commerce dataset using SQL to uncover insights around customer spending, revenue trends, product performance, and customer behavior. The analysis was performed on the `olist` database, joining data across the `customers`, `orders`, `order_items`, `order_payments`, and `products` tables.

## Business Questions
1. Who are the top 10 customers by total amount spent?
2. What is the monthly revenue trend across the dataset?
3. What is the month-over-month (MoM) change in revenue?
4. Which product categories generate the most revenue?
5. What are the top 3 products (by revenue) within each product category?
6. How can customers be segmented into spend tiers (Low / Medium / High)?
7. How many customers are repeat buyers vs. one-time buyers?
8. *(Reserved for additional analysis)*

## Key Findings
- **Top spenders:** A small group of customers account for a disproportionate share of total revenue, identified by ranking customers on total payment value.
- **Revenue trend:** Monthly revenue was aggregated by purchase date to reveal overall growth/decline patterns across the dataset's timeframe.
- **MoM change:** Using window functions (`LAG`), month-over-month revenue changes were calculated in both absolute and percentage terms, highlighting periods of acceleration or slowdown.
- **Category performance:** Product categories were ranked by total revenue, order count, and items sold to identify the strongest-performing categories (with unlabeled categories grouped as "Unknown").
- **Top products per category:** Using `ROW_NUMBER()` partitioned by category, the top 3 revenue-generating products in each category were isolated.
- **Customer spend tiers:** Customers were segmented into Low (<100), Medium (100–500), and High (>500) spend tiers based on total order value.
- **Repeat vs. one-time buyers:** Customers were classified by order count to quantify repeat purchase behavior versus single-purchase customers.

*(Add specific numbers/percentages here once the queries are run against the live database.)*

## Recommendations
- Focus retention efforts on **High**-tier and repeat-buyer segments, as they likely drive a large share of revenue.
- Investigate low-performing months identified in the MoM analysis to understand seasonality or external drivers.
- Prioritize marketing and inventory investment in top-revenue product categories and their best-selling products.
- Develop win-back or loyalty campaigns targeting one-time buyers to convert them into repeat customers.
- Use spend-tier segmentation to tailor promotions (e.g., upsell offers for Medium tier, VIP perks for High tier).

## Tools & Skills
- **SQL** (MySQL syntax): joins, aggregations, `GROUP BY`, `CASE` statements, CTEs (`WITH`), and window functions (`ROW_NUMBER()`, `LAG()`)
- **Database:** Olist e-commerce dataset (`olist` schema)
- Data analysis and business insight generation

## Files
| File | Description |
|------|--------------|
| `Q1 - Project.sql` | Top 10 customers by total spend |
| `Q2 - Project.sql` | Monthly revenue trend |
| `Q3 - Project.sql` | Month-over-month revenue change |
| `Q4 - Project.sql` | Revenue by product category |
| `Q5 - Project.sql` | Top 3 products per category by revenue |
| `Q6 - Project.sql` | Customer spend tier segmentation |
| `Q7 - Project.sql` | Repeat vs. one-time buyer counts |
| `Q8 - Project.sql` | *(empty / reserved for future analysis)* |
