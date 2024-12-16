-- suppliers with their products grouped by country

SELECT
    sp.supplier_name,
    sp.country,
    p.category,
    p.product_name
FROM Suppliers sp
INNER JOIN
    inventory iy ON sp.supplier_id = iy.inventory_id -- to link product_id with supplier_id using inventory table
INNER JOIN
    products p on iy.product_id = p.product_id
ORDER BY
    sp.country, sp.supplier_name, p.category;