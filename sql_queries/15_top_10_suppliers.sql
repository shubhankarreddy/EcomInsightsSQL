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