-- total supply vol by country

SELECT
    supplier_id,
    supplier_name,
    country,
    lead_time_days
FROM
    Suppliers
WHERE
    lead_time_days = (SELECT MIN(lead_time_days) FROM Suppliers)
ORDER BY
    lead_time_days ASC;