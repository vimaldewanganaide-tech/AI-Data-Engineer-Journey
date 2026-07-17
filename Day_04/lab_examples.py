"""Day 04 lab examples for SQL, data modeling, and workflow design."""

# Example SQL query strings for learning
employee_query = '''
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name,
       e.salary
FROM Employee e
LEFT JOIN Department d
  ON e.department_id = d.department_id
WHERE e.salary > 70000
ORDER BY e.salary DESC;
'''
print(employee_query)

aggregation_query = '''
SELECT d.department_name,
       COUNT(e.employee_id) AS employee_count,
       AVG(e.salary) AS average_salary
FROM Department d
JOIN Employee e
  ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 60000;
'''
print(aggregation_query)

# Example ETL workflow notes
etl_steps = [
    'Extract: read raw CSV from storage',
    'Transform: clean values and normalize types',
    'Load: write transformed data to analytics table',
]
print('ETL pipeline steps:')
for step in etl_steps:
    print('-', step)

# Data modeling example in code form
star_schema = {
    'fact_sales': ['sale_id', 'product_id', 'customer_id', 'sales_amount', 'sale_date'],
    'dim_product': ['product_id', 'product_name', 'category'],
    'dim_customer': ['customer_id', 'customer_name', 'region'],
}
print('Star schema example:', star_schema)
