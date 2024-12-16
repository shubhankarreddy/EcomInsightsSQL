-- routes with highest shipping cost

SELECT
    sr.origin_warehouse,
    sr.destination_region,
    sum(sr.shipping_cost_per_unit) AS shipping_cost
from shipping_routes sr
GROUP BY
    origin_warehouse, destination_region
ORDER BY shipping_cost DESC
LIMIT 5;