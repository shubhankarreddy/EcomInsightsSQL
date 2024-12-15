SELECT *
FROM suppliers;

-- listing all suppliers

SELECT
    sp.supplier_id,
    sp.supplier_name,
    sp.country,
    sp.annual_supply_volume as supply_vol
from Suppliers sp
ORDER BY supply_vol DESC ;

-- Top 10 suppliers

SELECT
    sp.supplier_id,
    sp.supplier_name,
    sp.country,
    sum(sp.annual_supply_volume) as total_supply
from Suppliers sp
GROUP BY sp.supplier_id, sp.supplier_name, sp.country
ORDER BY total_supply DESC
LIMIT 10;

-- total supply vol by country

SELECT
    sp.country as country,
    sum(sp.annual_supply_volume) as sp_vol
FROM Suppliers sp
GROUP BY sp.country
ORDER BY sp_vol DESC;

-- suppliers with their products grouped by country

SELECT
    sp.supplier_name,
    sp.country,
    p.category,
    p.product_name
FROM Suppliers sp
INNER JOIN
    inventory iy ON sp.supplier_id = iy.inventory_id -- to link product_id with supplier_id using inventory table
INNER JOIN
    products p on iy.product_id = p.product_id
ORDER BY
    sp.country, sp.supplier_name, p.category;

-- supply volume based on countries

SELECT
    sp.country,
    sum(sp.annual_supply_volume) as supply_vol_by_country
from Suppliers sp
GROUP BY sp.country
ORDER BY supply_vol_by_country DESC;

-- suppliers ranking by reliablity score

SELECT
    sp.supplier_name,
    sp.reliability_score,
    rank() OVER (ORDER BY sp.reliability_score DESC ) AS supplier_rank
from Suppliers sp
ORDER BY supplier_rank;

-- grading suppliers on the basis of reliablity_score
-- (grade A [Top-Tier]: 10-8, grade B[Mid-Tier] : 8-6, grade C[Low-Tier] : 6-4, grade D[At-Risk] : 4-0

SELECT
    sp.supplier_name,
    sp.reliability_score as rs,
    CASE
        WHEN sp.reliability_score >= 8 then 'Top-Tier'
        WHEN sp.reliability_score >= 6 THEN 'Mid-Tier'
        WHEN sp.reliability_score >= 4 THEN 'Low-Tier'
        WHEN sp.reliability_score >= 0 THEN 'At-Risk'
ELSE 'Unknown'
END AS supplier_level
from Suppliers sp
    ORDER BY sp.reliability_score DESC ;

-- top supplier by category

WITH supplier_cateogry AS (
    SELECT
        p.category,
        sp.supplier_name,
        sum(sp.annual_supply_volume) as supply_sum
from
    Suppliers sp
INNER JOIN
        inventory iy ON sp.supplier_id = iy.supplier_id
INNER JOIN
        products p ON iy.product_id = p.product_id
GROUP BY
    p.category, sp.supplier_name
)
SELECT
    category,
    supplier_name,
    supply_sum
FROM
    supplier_cateogry;

