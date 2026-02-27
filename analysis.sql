-- 1. Monthly Revenue Trend

SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;

-- 2. Top 10 Products by Revenue

SELECT 
    p.product_name,
    SUM(oi.quantity * oi.price) AS product_revenue
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY product_revenue DESC
LIMIT 10;

-- 3. Revenue by Product Category

SELECT 
    p.category,
    SUM(oi.quantity * oi.price) AS category_revenue
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

-- 4. Customer Lifetime Value

SELECT 
    c.customer_id,
    c.customer_name,
    SUM(o.total_amount) AS lifetime_value
FROM orders o
JOIN customers c 
    ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY lifetime_value DESC;

-- 5. Customer Purchase Frequency Classification

SELECT
    customer_id,
    COUNT(order_id) AS total_orders,
    CASE 
        WHEN COUNT(order_id) = 1 THEN 'One-time Buyer'
        ELSE 'Repeat Buyer'
    END AS customer_type
FROM orders
GROUP BY customer_id;

-- 6. Repeat Purchase Rate

SELECT 
    ROUND(
        SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 
    2) AS repeat_purchase_rate_percentage
FROM (
    SELECT 
        customer_id,
        COUNT(order_id) AS order_count
    FROM orders
    GROUP BY customer_id
) sub;

-- 7. Product Revenue Ranking

SELECT 
    product_name,
    product_revenue,
    RANK() OVER (ORDER BY product_revenue DESC) AS revenue_rank
FROM (
    SELECT 
        p.product_name,
        SUM(oi.quantity * oi.price) AS product_revenue
    FROM order_items oi
    JOIN products p 
        ON oi.product_id = p.product_id
    GROUP BY p.product_name
) sub;

-- 8. Revenue Contribution Percentage

WITH product_revenue AS (
    SELECT 
        p.product_name,
        SUM(oi.quantity * oi.price) AS revenue
    FROM order_items oi
    JOIN products p 
        ON oi.product_id = p.product_id
    GROUP BY p.product_name
)

SELECT 
    product_name,
    revenue,
    ROUND(
        revenue * 100.0 / SUM(revenue) OVER (),
    2) AS revenue_percentage
FROM product_revenue
ORDER BY revenue DESC;
