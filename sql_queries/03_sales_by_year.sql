-- total sales by year

SELECT
    YEAR(s.sale_date) AS sale_year,
    SUM(s.total_sale_amount) AS total_sales
FROM sales s
GROUP BY sale_year
ORDER BY sale_year DESC;

-- top selling products for year 2021

CREATE VIEW sales_view_2021 AS
SELECT
    p.product_id,
    p.product_name,
    p.category,
    year(s.sale_date) AS sale_year,
    sum(s.total_sale_amount) as total_revenue -- for 2021
FROM products p
INNER JOIN sales s on p.product_id = s.product_id
WHERE year(s.sale_date) = 2021
GROUP BY p.product_id, p.product_name, p.category, sale_year
ORDER BY total_revenue DESC
LIMIT 10;

SELECT * FROM sales_view_2021; -- verifying results

-- top selling products for year 2022

CREATE VIEW sales_view_2022 AS
SELECT
    p.product_id,
    p.product_name,
    p.category,
    year(s.sale_date) AS sale_year,
    sum(s.total_sale_amount) as total_revenue -- for 2022
FROM products p
INNER JOIN sales s on p.product_id = s.product_id
WHERE year(s.sale_date) = 2022
GROUP BY p.product_id, p.product_name, p.category, sale_year
ORDER BY total_revenue DESC
LIMIT 10;

SELECT * FROM sales_view_2022; -- verifying results

-- top selling products for year 2023

CREATE VIEW sales_view_2023 AS
SELECT
    p.product_id,
    p.product_name,
    p.category,
    year(s.sale_date) AS sale_year,
    sum(s.total_sale_amount) as total_revenue -- for 2023
FROM products p
INNER JOIN sales s on p.product_id = s.product_id
WHERE year(s.sale_date) = 2023
GROUP BY p.product_id, p.product_name, p.category, sale_year
ORDER BY total_revenue DESC
LIMIT 10;

SELECT * FROM sales_view_2023; -- verifying results