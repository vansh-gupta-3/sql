DROP PROCEDURE IF EXISTS CalculateManagerBonus;
CREATE PROCEDURE CalculateManagerBonus(
    IN p_manager_emp_id INT,
    IN p_bonus_percentage DECIMAL(5,2)
)
BEGIN
    SELECT 
        mgr.name AS manager_name,
        SUM(o1.quantity * p.price) AS total_revenue,
        SUM(o1.quantity * p.price) * (p_bonus_percentage / 100) AS calculated_bonus

    FROM employee_db.employees mgr  -- contains the entire employees table
    -- Join employees to find the direct reports of manager
    JOIN employee_db.employees e ON e.manager_id = mgr.employee_id 
    -- creates a joined table of e and mgr
    JOIN employee_db.orders o ON o.employee_id = e.employee_id
    JOIN employee_db.order_items o1 ON o.order_id = o1.order_id
    JOIN employee_db.products p ON o1.product_id = p.product_id
    WHERE mgr.employee_id = p_manager_emp_id AND o.status = 'Completed'
    -- manager's employee id which is matched with employees' manager id
    GROUP BY mgr.name;
END;

-- CALL CalculateManagerBonus(1, 5.00);
-- Highlight call line and then run selected query