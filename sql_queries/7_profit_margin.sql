-- calculating profit margin

SELECT
    p.category,
    SUM(s.total_sale_amount) AS total_sales,
    SUM(p.manufacturing_cost * s.quantity_sold) AS total_cost,
    (SUM(s.total_sale_amount) - SUM(p.manufacturing_cost * s.quantity_sold)) / SUM(s.total_sale_amount) * 100 AS profit_mgn_pct
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY profit_mgn_pct DESC;