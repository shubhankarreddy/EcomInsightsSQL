-- products ranked by profit mgn

SELECT
    p.product_name,
    p.category,
    p.base_price,
    p.manufacturing_cost,
    (base_price - manufacturing_cost) AS profit,
    ((base_price - manufacturing_cost) / base_price) * 100 AS profit_mgn_pct
FROM products p
ORDER BY profit_mgn_pct DESC;