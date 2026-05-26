-- Query 1 — Total Revenue
SELECT
SUM(quantity * unit_price) AS total_revenue
FROM ecommerce_dataset_10000;
-- Query 2 — Revenue by Category
SELECT
category,
SUM(quantity * unit_price) AS revenue
FROM ecommerce_dataset_10000
GROUP BY category
ORDER BY revenue DESC;
-- Query 3 — Customer Segmentation
SELECT
customer_id,
product_name,
(quantity * unit_price) AS order_value,

CASE
WHEN (quantity * unit_price) > 500 THEN 'High Value'
WHEN (quantity * unit_price) >= 200 THEN 'Medium Value'
ELSE 'Low Value'
END AS customer_segment

FROM ecommerce_dataset_10000;
-- Query 4 — Top Customers
SELECT
customer_id,
SUM(quantity * unit_price) AS total_spent

FROM ecommerce_dataset_10000

GROUP BY customer_id

HAVING total_spent > 5000

ORDER BY total_spent DESC;
-- Query 5 — Payment Analysis
SELECT
payment_method,
SUM(quantity * unit_price) AS revenue

FROM ecommerce_dataset_10000

GROUP BY payment_method

ORDER BY revenue DESC;
-- Query 6 — Product Ranking
SELECT
category,
product_name,
SUM(quantity * unit_price) AS revenue,

RANK() OVER(
PARTITION BY category
ORDER BY SUM(quantity * unit_price) DESC
) AS product_rank

FROM ecommerce_dataset_10000

GROUP BY category, product_name;
-- Query 7 — Monthly Revenue Trend
SELECT
MONTH(order_date) AS sales_month,

SUM(quantity * unit_price) AS revenue

FROM ecommerce_dataset_10000

GROUP BY sales_month

ORDER BY revenue DESC;
