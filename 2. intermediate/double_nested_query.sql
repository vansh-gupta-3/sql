-- To find employees who earned highest single order amount in their department
SELECT
    e.employee_id,
    e.name,
    o.amount,
    e.department
FROM
    employees e
JOIN orders o ON e.employee_id = o.employee_id
AND o.amount = (
      SELECT MAX(o2.amount) 
      FROM employees e2 
      JOIN orders o2 ON e2.employee_id = o2.employee_id 
      WHERE e2.department = e.department AND o2.status != 'Cancelled'
    )