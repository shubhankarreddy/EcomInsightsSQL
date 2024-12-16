-- top selling products by qty

SELECT
    p.product_name,
    SUM(s.quantity_sold) AS total_quantity_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 10;