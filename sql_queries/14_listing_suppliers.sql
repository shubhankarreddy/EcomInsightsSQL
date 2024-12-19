-- listing suppliers


SELECT
    sp.country AS supp_country,
    SUM(sp.annual_supply_volume) AS total_supply_volume
FROM Suppliers sp
GROUP BY sp.country
ORDER BY total_supply_volume DESC;
