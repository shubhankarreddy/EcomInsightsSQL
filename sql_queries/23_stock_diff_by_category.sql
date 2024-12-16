-- Finding avg stock diff based on category

SELECT
    p.category,
    AVG(iy.current_stock - iy.reorder_level) AS avg_stock_difference
FROM
    inventory iy
JOIN products p ON iy.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_stock_difference DESC ;