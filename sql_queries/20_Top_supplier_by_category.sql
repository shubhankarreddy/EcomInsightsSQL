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
