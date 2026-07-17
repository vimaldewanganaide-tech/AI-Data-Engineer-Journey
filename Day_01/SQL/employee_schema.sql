-- Day 1 SQL practice schema for Employee and Department tables

CREATE TABLE IF NOT EXISTS Department (
    department_id INTEGER PRIMARY KEY,
    department_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Employee (
    employee_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    department_id INTEGER,
    salary REAL NOT NULL,
    hire_date TEXT DEFAULT (DATE('now')),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Sample data inserts
INSERT INTO Department (department_id, department_name)
VALUES
    (1, 'Engineering'),
    (2, 'Human Resources'),
    (3, 'Sales');

INSERT INTO Employee (employee_id, first_name, last_name, department_id, salary)
VALUES
    (101, 'Alex', 'Taylor', 1, 120000.00),
    (102, 'Mina', 'Gupta', 2, 85000.00),
    (103, 'Noah', 'Chen', 3, 92000.00);

-- Query examples
SELECT employee_id, first_name, last_name, salary
FROM Employee
WHERE salary > 90000
ORDER BY salary DESC;

SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.department_name;
