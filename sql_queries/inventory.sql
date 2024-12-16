SELECT *
FROM inventory;

-- inventory status
SELECT
    p.product_name,
    p.category,
    iy.current_stock,
    iy.reorder_level,
    (iy.current_stock - iy.reorder_level) AS stock_diff
from
    products p
INNER JOIN
        inventory iy ON p.product_id = iy.product_id
ORDER BY
    iy.current_stock DESC ;

-- Finding avg stock diff based on category

SELECT
    p.category,
    AVG(iy.current_stock - iy.reorder_level) AS avg_stock_difference
FROM
    inventory iy
JOIN products p ON iy.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_stock_difference DESC ;

-- Identify products that are low on stock

SELECT
    p.product_name,
    p.category,
    iy.current_stock,
    iy.reorder_level,
    (iy.current_stock - iy.reorder_level) as stock_lvl
from inventory iy
JOIN ecommerce_db.products p ON iy.product_id = p.product_id
WHERE iy.current_stock <= iy.reorder_level
AND
    p.category IN ('Accesories','Tablet','Smartphones','Laptops')
ORDER BY stock_lvl DESC ;

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