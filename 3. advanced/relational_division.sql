SELECT 
    o.order_id,
    COUNT(DISTINCT p.category) AS unique_categories
FROM employee_db.orders o
JOIN employee_db.order_items o1 ON o.order_id = o1.order_id
JOIN employee_db.products p ON o1.product_id = p.product_id
WHERE o.status = 'Completed' 
  AND p.category IN ('Electronics', 'Furniture')
GROUP BY o.order_id
HAVING COUNT(DISTINCT p.category) = 2;

/*
HAVING MIN(o1.product_id) < 20 AND MAX(o1.product_id) > 20;
The above is for domain specific logic
*/