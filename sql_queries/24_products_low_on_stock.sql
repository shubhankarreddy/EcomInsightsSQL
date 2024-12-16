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