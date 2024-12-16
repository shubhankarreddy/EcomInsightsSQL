-- total supply vol by country

SELECT
    sp.country as country,
    sum(sp.annual_supply_volume) as sp_vol
FROM Suppliers sp
GROUP BY sp.country
ORDER BY sp_vol DESC;