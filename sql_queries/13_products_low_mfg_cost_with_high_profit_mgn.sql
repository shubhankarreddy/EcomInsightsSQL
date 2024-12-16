-- products with low cost and high profit margin

SELECT
    product_name,
    category,
    base_price,
    manufacturing_cost,
    (base_price - manufacturing_cost) AS profit,
    ((base_price - manufacturing_cost) / manufacturing_cost) * 100 AS pft_pct
FROM products
WHERE manufacturing_cost < 500
ORDER BY pft_pct DESC;