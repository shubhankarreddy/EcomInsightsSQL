-- routes with highest carbon footprint

SELECT
    sr.origin_warehouse,
    sr.destination_region,
    SUM(sr.carbon_footprint_kg) AS total_carbon_footprint
FROM
    shipping_routes sr
GROUP BY
    sr.origin_warehouse, sr.destination_region
ORDER BY
    total_carbon_footprint DESC
LIMIT 10;
