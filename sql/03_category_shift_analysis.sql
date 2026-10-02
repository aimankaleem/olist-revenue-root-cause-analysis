USE olist_ecommerce;

-- Milestone 3: Category-Level Revenue Shift (May vs June 2018)
WITH category_sales AS (
    SELECT 
        COALESCE(p.product_category_name, 'Unknown') AS category,
        SUBSTRING(o.order_purchase_timestamp, 1, 7) AS order_month,
        SUM(oi.price) AS total_revenue,
        COUNT(DISTINCT o.order_id) AS total_orders
    FROM olist_orders o
    JOIN olist_order_items oi ON o.order_id = oi.order_id
    JOIN olist_products p ON oi.product_id = p.product_id
    WHERE o.order_status = 'delivered'
      AND SUBSTRING(o.order_purchase_timestamp, 1, 7) IN ('2018-05', '2018-06')
    GROUP BY category, order_month
)
SELECT 
    category,
    ROUND(SUM(CASE WHEN order_month = '2018-05' THEN total_revenue ELSE 0 END), 2) AS rev_may_2018,
    ROUND(SUM(CASE WHEN order_month = '2018-06' THEN total_revenue ELSE 0 END), 2) AS rev_jun_2018,
    ROUND(SUM(CASE WHEN order_month = '2018-06' THEN total_revenue ELSE 0 END) - 
          SUM(CASE WHEN order_month = '2018-05' THEN total_revenue ELSE 0 END), 2) AS revenue_diff
FROM category_sales
GROUP BY category
ORDER BY revenue_diff ASC
LIMIT 10;