-- sales revenue by product

SELECT
    p.product_name,
    SUM(s.total_sale_amount) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;