-- under performing products ( on the basis that product have high stock level but low sales)

SELECT p.product_name,
       p.category,
       sum(sa.quantity_sold) AS qty_sold,
       sum(sa.total_sale_amount) AS total_sales,
       iy.current_stock,
       iy.reorder_level
FROM products p
INNER JOIN sales sa ON p.product_id = sa.product_id
INNER JOIN inventory iy ON p.product_id = iy.product_id
GROUP BY
    p.product_name, p.category, iy.current_stock, iy.reorder_level
HAVING
    (sum(sa.quantity_sold) < 4 OR sum(sa.total_sale_amount) < 6000) -- avg qty sold = 5 and avg_sale = 7040
AND
    iy.current_stock > iy.reorder_level
ORDER BY
    total_sales ASC , qty_sold ASC;