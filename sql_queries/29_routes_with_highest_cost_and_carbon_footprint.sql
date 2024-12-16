-- avg carbon footprint

SELECT avg(sr.carbon_footprint_kg) as avg_carbon_footprint
from shipping_routes sr;

-- avg shipping cost

SELECT avg(sr.shipping_cost_per_unit) as avg_shipping_cost
from shipping_routes sr;

-- route with highest cost and carbon footprint

SELECT
    sr.origin_warehouse,
    sr.destination_region,
    sr.carbon_footprint_kg,
    sr.shipping_cost_per_unit
FROM
    shipping_routes sr
WHERE
    carbon_footprint_kg > 300 -- avg carboon footprint is 243
AND shipping_cost_per_unit > 30 -- avg shipping cost being 26
ORDER BY
    carbon_footprint_kg DESC, shipping_cost_per_unit DESC;
