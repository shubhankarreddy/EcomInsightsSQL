-- identify top selling products by year

SELECT * FROM products; -- view table
SELECT * FROM Sales; -- view table

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


-- Top selling prodcuts over the years

-- (Obj : need to calculate top selling products over the year)

WITH ranked_sales AS (
    SELECT p.producT_id,
           p.product_name,
           p.category,
           year(s.sale_date) as sale_year,
           sum(s.total_sale_amount) as toal_revenue,
           rank() OVER (PARTITION BY year(s.sale_date) ORDER BY sum(s.total_Sale_amount) DESC ) AS s_rank
    from products p
    inner JOIN Sales s ON p.product_id = s.product_id
    GROUP BY p.product_id, p.product_name, p.category, year(s.sale_date)
)

SELECT *
FROM ranked_sales
WHERE s_rank <= 10
ORDER BY s_rank;

-- Total sales by category

SELECT p.category, SUM(s.total_sale_amount) AS total_sales
FROM products p
INNEr JOIN sales s on p.product_id = s.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

-- sales by region

SELECT s.customer_region, sum(s.total_sale_amount) as region_sales
FROM sales s
GROUP BY s.customer_region
ORDER BY region_sales DESC;