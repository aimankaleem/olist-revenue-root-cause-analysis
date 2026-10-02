USE olist_ecommerce;

-- Milestone 2: Delivery Delays & Lead Times
SELECT 
    SUBSTRING(order_purchase_timestamp, 1, 7) AS order_month,
    COUNT(order_id) AS total_orders,
    -- Average days taken from purchase to customer delivery
    ROUND(AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)), 1) AS avg_delivery_days,
    -- Average days estimated by Olist
    ROUND(AVG(DATEDIFF(order_estimated_delivery_date, order_purchase_timestamp)), 1) AS avg_estimated_days,
    -- Percentage of orders delivered late past estimated date
    ROUND(SUM(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 ELSE 0 END) * 100.0 / COUNT(order_id), 2) AS pct_delayed_orders
FROM olist_orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
GROUP BY order_month
ORDER BY order_month;