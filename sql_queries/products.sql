
SELECT * FROM products; -- view table

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

-- avg warranty for products

SELECT
    p.category,
    AVG(warranty_months) AS avg_warranty_in_months
FROM products p
GROUP BY category
ORDER BY avg_warranty_in_months DESC;

-- product with high manufacturing cost by category

SELECT
    p.category,
    AVG(manufacturing_cost) AS avg_mfg_cost
FROM
    products p
GROUP BY category
ORDER BY avg_mfg_cost DESC;

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

-- Number of products by brands
SELECT
    brand,
    COUNT(*) AS product_count
FROM products
GROUP BY brand
ORDER BY product_count DESC;










