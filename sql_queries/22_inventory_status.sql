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
