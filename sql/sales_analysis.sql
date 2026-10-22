
-- Sales Data Analysis Using SQL
-- Dataset: data/sales_data.csv
-- Sample data for portfolio practice

-- 1. Overall Sales KPIs
SELECT
    SUM(quantity * unit_price) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_units_sold,
    ROUND(
        SUM(quantity * unit_price) * 1.0
        / COUNT(DISTINCT order_id), 2
    ) AS average_order_value
FROM sales;

-- 2. Monthly Revenue
SELECT
    SUBSTR(order_date, 1, 7) AS sales_month,
    SUM(quantity * unit_price) AS monthly_revenue
FROM sales
GROUP BY SUBSTR(order_date, 1, 7)
ORDER BY sales_month;

-- 3. Revenue by Product
SELECT
    product,
    SUM(quantity) AS units_sold,
    SUM(quantity * unit_price) AS revenue
FROM sales
GROUP BY product
ORDER BY revenue DESC;

-- 4. Revenue by Category
SELECT
    category,
    SUM(quantity * unit_price) AS revenue
FROM sales
GROUP BY category
ORDER BY revenue DESC;

-- 5. Revenue by Region
SELECT
    region,
    SUM(quantity * unit_price) AS revenue
FROM sales
GROUP BY region
ORDER BY revenue DESC;

-- 6. Best-Selling Products
SELECT
    product,
    SUM(quantity) AS units_sold
FROM sales
GROUP BY product
ORDER BY units_sold DESC;
