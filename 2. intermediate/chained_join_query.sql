-- To select employees whose order amount is higher than average
SELECT
    e.name AS employee_name,
    d.location AS dept_location, -- tables in the JOIN line can also be selected, not just FROM
    o.amount AS order_amount
FROM
    employees e
JOIN departments d ON e.department = d.dept_name
JOIN orders o ON e.employee_id = o.employee_id
WHERE
    o.amount > (SELECT AVG(amount) FROM orders);
