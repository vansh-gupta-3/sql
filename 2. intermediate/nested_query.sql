-- To select those employees whose orders are all completed
SELECT
    e.employee_id,
    e.name
FROM
    employees e
JOIN orders o ON e.employee_id = o.employee_id
WHERE
    e.employee_id IN (SELECT o.employee_id FROM orders o)
    AND  e.employee_id NOT IN (
        SELECT o.employee_id
        FROM orders o
        where o.status!='Completed'
    );