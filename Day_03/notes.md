# Day 03 Notes: Python Control Flow & SQL Filtering

## Python Operators and Precedence

- Arithmetic operators: `+`, `-`, `*`, `/`, `//`, `%`, `**`
- Comparison operators: `==`, `!=`, `<`, `>`, `<=`, `>=`
- Logical operators: `and`, `or`, `not`
- Bitwise operators: `&`, `|`, `^`, `~`, `<<`, `>>`
- Identity operators: `is`, `is not`
- Membership operators: `in`, `not in`
- Operator precedence determines evaluation order:
  - parentheses first, then exponentiation, then multiplication/division, then addition/subtraction.

Example:
```python
result = 3 + 2 * 5  # 13
result = (3 + 2) * 5  # 25
```

## Python Conditional Logic

- Use `if`, `elif`, and `else` for decision making.
- Nested conditions allow multi-step logic.
- `break` exits a loop early.
- `continue` skips the current loop iteration.
- `pass` is a placeholder statement that does nothing.

Example:
```python
score = 88
if score >= 90:
    grade = 'A'
elif score >= 80:
    grade = 'B'
else:
    grade = 'C'
```

## Python Loops and Comprehensions

- `for` loops iterate over iterables like lists and strings.
- `while` loops repeat while a condition remains true.
- `range()` generates sequences of numbers.
- Nested loops process multidimensional data.
- List comprehensions create new lists in a compact form.

Examples:
```python
for i in range(5):
    print(i)

numbers = [1, 2, 3]
squares = [x * x for x in numbers]
```

## SQL Filtering Basics

- `WHERE` selects rows that match a condition.
- `DISTINCT` returns unique values.
- `ORDER BY` sorts results.
- `LIMIT` restricts row count.
- `LIKE` matches patterns.
- `IN` filters values in a list.
- `BETWEEN` selects a range.
- `IS NULL` and `IS NOT NULL` test for missing values.
- Use `AND`, `OR`, and `NOT` for compound filters.

Example:
```sql
SELECT *
FROM employees
WHERE department_name = 'Sales'
  AND salary > 70000
ORDER BY salary DESC
LIMIT 10;
```

## Practice Tasks

- Build an Employee Salary Analyzer with Python.
- Process student results using loops and conditions.
- Filter SQL employee records using `WHERE`, `IN`, `LIKE`, and `BETWEEN`.
- Find top earners with `ORDER BY` and `LIMIT`.
- Generate department-wise reports using SQL and Python.

## Day 03 Learning Summary

- Master Python control flow, operators, and loops.
- Apply SQL filtering for real-world data queries.
- Use Python and SQL together to analyze employee records.
- Build a mini analytics application and document the process.
