-- top selling prodcut

SELECT
    p.product_name,
    SUM(s.total_sale_amount) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

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

-- sales revenue by product

SELECT
    p.product_name,
    SUM(s.total_sale_amount) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- top selling products by qty

SELECT
    p.product_name,
    SUM(s.quantity_sold) AS total_quantity_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- sales by customer region

SELECT
    s.customer_region,
    SUM(s.total_sale_amount) AS total_revenue
FROM sales s
GROUP BY s.customer_region
ORDER BY total_revenue DESC;

-- calculating profit margin

SELECT
    p.category,
    SUM(s.total_sale_amount) AS total_sales,
    SUM(p.manufacturing_cost * s.quantity_sold) AS total_cost,
    (SUM(s.total_sale_amount) - SUM(p.manufacturing_cost * s.quantity_sold)) / SUM(s.total_sale_amount) * 100 AS profit_mgn_pct
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY profit_mgn_pct DESC;