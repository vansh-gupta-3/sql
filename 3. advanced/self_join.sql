-- Market Basket analysis: To find pairs of products that are bought frequently together
SELECT 
    p1.product_name AS product_A, 
    p2.product_name AS product_B,
    COUNT(*) AS frequency
FROM employee_db.order_items o1
JOIN employee_db.order_items o2 ON o1.order_id = o2.order_id AND o1.product_id < o2.product_id
-- AND in the above line makes sure that duplicate of pair is not shown or that
-- a product is not matched with itself
JOIN employee_db.products p1 ON o1.product_id = p1.product_id
JOIN employee_db.products p2 ON o2.product_id = p2.product_id
GROUP BY p1.product_name, p2.product_name
ORDER BY frequency DESC;
-- GROUP BY essentially drops pairs into a bucket such as [laptop, monitor]
-- All clauses have the ability to look at raw column values