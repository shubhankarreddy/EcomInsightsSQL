-- view shipping route table
SELECT *
FROM shipping_routes;

-- calculating shipping cost based on region

SELECT
    sr.destination_region,
    sum(sr.shipping_cost_per_unit) as total_shipping_cost
from shipping_routes sr
GROUP BY
    sr.destination_region
ORDER BY
    total_shipping_cost DESC ;