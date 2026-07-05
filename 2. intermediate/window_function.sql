-- To find employees who earned highest single order amount in their department with window functions
WITH RankedOrders AS (   -- Create virtual table
    SELECT 
        e.employee_id, 
        e.name,
        o.amount,
        e.department,
        RANK() OVER (PARTITION BY e.department ORDER BY o.amount DESC) as order_rank
    FROM employees e 
    JOIN orders o ON e.employee_id = o.employee_id 
    WHERE o.status != 'Cancelled'
)
SELECT employee_id, name, department, amount
FROM RankedOrders
WHERE order_rank = 1;
