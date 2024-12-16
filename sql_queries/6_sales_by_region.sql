-- sales by customer region

SELECT
    s.customer_region,
    SUM(s.total_sale_amount) AS total_revenue
FROM sales s
GROUP BY s.customer_region
ORDER BY total_revenue DESC;