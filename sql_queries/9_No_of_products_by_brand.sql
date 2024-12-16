-- Number of products by brands
SELECT
    brand,
    COUNT(*) AS product_count
FROM products
GROUP BY brand
ORDER BY product_count DESC;