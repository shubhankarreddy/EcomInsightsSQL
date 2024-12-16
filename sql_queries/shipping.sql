SELECT *
FROM shipping_routes;

-- Avg delivery time based on routes

SELECT
    sr.route_id,
    sr.origin_warehouse,
    sr.destination_region,
    AVG(sr.average_delivery_time) AS avg_delivery_time
FROM
    shipping_routes sr
JOIN
    sales sa ON sr.route_id = sa.shipping_route_id
GROUP BY
    sr.route_id, sr.origin_warehouse, sr.destination_region
ORDER BY
    avg_delivery_time ASC;
