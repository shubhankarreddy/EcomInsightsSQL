-- Total sales by category

SELECT p.category,
       SUM(s.total_sale_amount) AS total_sales
FROM products p
INNEr JOIN sales s on p.product_id = s.product_id
GROUP BY p.category
ORDER BY total_sales DESC;