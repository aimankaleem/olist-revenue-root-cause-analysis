USE olist_ecommerce;

SELECT 
    SUBSTRING(o.order_purchase_timestamp, 1, 7) AS order_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS monthly_revenue,
    ROUND(SUM(oi.price) / COUNT(DISTINCT o.order_id), 2) AS average_order_value
FROM olist_orders o
JOIN olist_order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY order_month
ORDER BY order_month;
