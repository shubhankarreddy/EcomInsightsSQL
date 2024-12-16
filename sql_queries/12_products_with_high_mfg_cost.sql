-- product with high manufacturing cost by category

SELECT
    p.category,
    AVG(manufacturing_cost) AS avg_mfg_cost
FROM
    products p
GROUP BY category
ORDER BY avg_mfg_cost DESC;