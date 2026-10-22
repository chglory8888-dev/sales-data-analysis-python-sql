-- Sales Data Analysis Using SQL
-- Sample dataset: data/sales_data.csv

-- 1. Total revenue, orders, and units sold
SELECT
    SUM(quantity * unit_price) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_units_sold
FROM sales;

-- 2. Monthly revenue
SELECT
    SUBSTR(order_date, 1, 7) AS sales_month,
    SUM(quantity * unit_price) AS monthly_revenue
FROM sales
GROUP BY SUBSTR(order_date, 1, 7)
ORDER BY sales_month;

-- 3. Revenue by product
SELECT
    product,
    SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;

-- 4. Revenue by category
SELECT
    category,
    SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;

-- 5. Revenue by region
SELECT
    region,
    SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

-- 6. Best-selling products by quantity
SELECT
    product,
    SUM(quantity) AS units_sold
FROM sales
GROUP BY product
ORDER BY units_sold DESC;

-- 7. Average order value
SELECT
    SUM(quantity * unit_price) * 1.0
        / COUNT(DISTINCT order_id) AS average_order_value
FROM sales;
