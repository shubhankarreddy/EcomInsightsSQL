
-- identify fast and slow moving products

SELECT
    p.product_name,
    p.category,
    SUM(sa.quantity_sold) AS total_quantity_sold,
    AVG((iy.current_stock + iy.reorder_level) / 2) AS avg_inventory,
    (SUM(sa.quantity_sold) / AVG((iy.current_stock + iy.reorder_level) / 2)) AS inventory_turnover_rate,
    CASE
        WHEN (SUM(sa.quantity_sold) / AVG((iy.current_stock + iy.reorder_level) / 2)) >= 1 THEN 'High'
        WHEN (SUM(sa.quantity_sold) / AVG((iy.current_stock + iy.reorder_level) / 2)) >= 0.5 THEN 'Medium'
        ELSE 'Low'
    END AS inventory_turnover_grade
FROM products p
JOIN
    sales sa ON p.product_id = sa.product_id
JOIN
    inventory iy ON p.product_id = iy.product_id
GROUP BY
    p.product_name, p.category
ORDER BY
    inventory_turnover_rate DESC;