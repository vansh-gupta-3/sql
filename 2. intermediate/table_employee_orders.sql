CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    employee_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(20)
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);


INSERT INTO employees VALUES
(1, 'Alice', 'Sales', NULL, 90000),
(2, 'Bob', 'Sales', 1, 65000),
(3, 'Charlie', 'Sales', 1, 60000),
(4, 'David', 'Marketing', 3, 85000),
(5, 'Eva', 'Marketing', 4, 70000),
(6, 'Frank', 'HR', NULL, 55000);

INSERT INTO orders VALUES
(101, 2, '2026-01-15', 5000.00, 'Completed'),
(102, 2, '2026-02-20', 3000.00, 'Completed'),
(103, 3, '2026-03-05', 7000.00, 'Completed'),
(104, 3, '2026-03-12', 1500.00, 'Cancelled'),
(105, 2, '2026-04-10', 4500.00, 'Completed'),
(106, 5, '2026-05-01', 2000.00, 'Completed'),
(107, 5, '2026-05-15', 3500.00, 'Completed'),
(108, 6, '2026-05-19', 2500.00, 'Cancelled'),
(109, 3, '2026-06-02', 8000.00, 'Completed');

INSERT INTO departments VALUES
(1, 'Sales', 'Boston'),
(2, 'Marketing', 'New York'),
(3, 'HR', 'LA');