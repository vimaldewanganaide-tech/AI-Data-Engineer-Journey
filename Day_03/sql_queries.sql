-- Day 03 SQL filtering examples for employee database

-- Select employees with salary > 80000
SELECT employee_id, first_name, last_name, department_name, salary
FROM employees
WHERE salary > 80000
ORDER BY salary DESC;

-- Find distinct departments
SELECT DISTINCT department_name
FROM employees;

-- Top 5 salaries
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- Employees in specific departments
SELECT first_name, last_name, department_name, salary
FROM employees
WHERE department_name IN ('Engineering', 'Marketing');

-- Use LIKE to find names that start with J
SELECT first_name, last_name, salary
FROM employees
WHERE first_name LIKE 'J%';

-- Find employees with missing manager id
SELECT first_name, last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

-- Complex filter with AND/OR/NOT
SELECT first_name, last_name, department_name, salary
FROM employees
WHERE (department_name = 'Sales' AND salary > 70000)
   OR (department_name = 'HR' AND salary BETWEEN 50000 AND 70000)
   AND NOT (first_name = 'Test');
