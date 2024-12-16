-- supply volume based on countries

SELECT
    sp.country,
    sum(sp.annual_supply_volume) as supply_vol_by_country
from Suppliers sp
GROUP BY sp.country
ORDER BY supply_vol_by_country DESC;
