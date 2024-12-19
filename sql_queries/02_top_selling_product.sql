-- top selling product

SELECT
    p.product_name,
    SUM(s.total_sale_amount) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 10;

SELECT p.product_name, count(p.product_name) as np
from products p
group by 1;