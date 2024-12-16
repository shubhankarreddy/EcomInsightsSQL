-- avg warranty for products

SELECT
    p.category,
    AVG(warranty_months) AS avg_warranty_in_months
FROM products p
GROUP BY category
ORDER BY avg_warranty_in_months DESC;
