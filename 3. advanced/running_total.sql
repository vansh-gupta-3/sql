-- To calculate running monthly total by department
SELECT
    e.department AS department,
    EXTRACT(MONTH FROM ord.order_date) as month,
    SUM(p.price*oi.quantity) as monthly_revenue,
    SUM(SUM(p.price*oi.quantity)) OVER (
        PARTITION BY e.department 
        ORDER BY EXTRACT(MONTH FROM ord.order_date)
    ) AS cumulative_revenue
FROM employee_db.employees e
JOIN employee_db.orders ord ON e.employee_id=ord.employee_id
JOIN employee_db.order_items oi ON ord.order_id=oi.order_id
JOIN employee_db.products p ON oi.product_id=p.product_id
GROUP BY 
    e.department, 
    EXTRACT(MONTH FROM ord.order_date)
/*
GROUP BY carries the whole row from virtual table as payload of the bucket.
So [sales, 1] bucket will contain all other attributes from the row in virtual table
Once GROUP BY is completed, the virtual table is destroyed
The buckets and their payloads are then passed onto the SELECT clause

If aggregate function and column are both selected at the same time,
GROUP BY function is required and its arguments will contain all the
non aggregated functions
*/
ORDER BY month, department ASC;
-- Month is primary sort and department is secondary sort
-- Sorts by month first and then within a month, sorts departments alphabetically