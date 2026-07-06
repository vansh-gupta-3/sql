-- To explore queries between multiple databases 
SELECT * FROM employee_db.employees; -- Distinguish between two employees tables in different db

-- Selecting names of employees from two different databases at the same time
SELECT 
    e1.employee_id, 
    e1.name AS db1_name, 
    e2.name AS db2_name
FROM sys.employees AS e1
INNER JOIN employee_db.employees AS e2 ON e1.employee_id = e2.employee_id;

-- Inner join to see who is in both the databases