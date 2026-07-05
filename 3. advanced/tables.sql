CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    employee_id INT,
    order_date DATE,
    status VARCHAR(20)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);

-- Insert Data
INSERT INTO employees VALUES
(1, 'Alice', 'Sales', NULL, 90000), (2, 'Bob', 'Sales', 1, 65000),
(3, 'Charlie', 'Sales', 1, 60000), (4, 'David', 'Marketing', NULL, 85000),
(5, 'Eva', 'Marketing', 4, 70000), (6, 'Frank', 'HR', NULL, 55000);

INSERT INTO products VALUES
(10, 'Laptop', 'Electronics', 1200.00), (20, 'Monitor', 'Electronics', 300.00),
(30, 'Desk Chair', 'Furniture', 250.00), (40, 'Desk Lamp', 'Furniture', 50.00);

INSERT INTO orders VALUES
(101, 2, '2026-01-15', 'Completed'), (102, 2, '2026-02-20', 'Completed'),
(103, 3, '2026-03-05', 'Completed'), (104, 3, '2026-03-12', 'Cancelled'),
(105, 2, '2026-04-10', 'Completed'), (106, 5, '2026-05-01', 'Completed'),
(107, 6, '2026-05-15', 'Completed');

INSERT INTO order_items VALUES
(101, 10, 2), (101, 20, 1), -- Order 101: 2 Laptops, 1 Monitor
(102, 20, 2),                -- Order 102: 2 Monitors
(103, 30, 4), (103, 40, 2), -- Order 103: 4 Chairs, 2 Lamps
(104, 10, 1),                -- Order 104: 1 Laptop
(105, 10, 1), (105, 30, 1), -- Order 105: 1 Laptop, 1 Chair
(106, 20, 3),                -- Order 106: 3 Monitors
(107, 40, 10);               -- Order 107: 10 Lamps
