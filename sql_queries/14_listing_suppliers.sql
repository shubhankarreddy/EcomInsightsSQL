-- listing all suppliers

SELECT
    sp.supplier_id,
    sp.supplier_name,
    sp.country,
    sp.annual_supply_volume as supply_vol
from Suppliers sp
ORDER BY supply_vol DESC ;