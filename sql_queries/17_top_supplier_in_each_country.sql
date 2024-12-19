-- name top supplier in each country

WITH supplier_ranked AS (
    SELECT
        sp.supplier_id,
        sp.supplier_name,
        sp.country AS supp_country,
        sp.annual_supply_volume AS supply_vol,
        RANK() OVER (PARTITION BY sp.country ORDER BY sp.annual_supply_volume DESC) AS rank_in_country
    FROM Suppliers sp
)
SELECT
    supplier_id,
    supplier_name,
    supp_country,
    supply_vol
FROM supplier_ranked
WHERE rank_in_country = 1
ORDER BY supply_vol DESC;
