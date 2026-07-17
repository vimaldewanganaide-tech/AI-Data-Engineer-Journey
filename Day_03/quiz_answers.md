# Day 3 Quiz Answers

1. `==` checks value equality, while `is` checks whether two variables reference the same object in memory.
2. Arithmetic operators: `+`, `-`, `*`, `/`; comparison operators: `==`, `!=`, `<`, `>`; logical operators: `and`, `or`, `not`.
3. Operator precedence means multiplication runs before addition, so `3 + 4 * 2` equals `11`, not `14`.
4. `elif` allows checking additional conditions after an initial `if`; it runs only if previous conditions were false.
5. Example:
```python
for i in range(1, 6):
    print(i)
```
6. Use a `while` loop when the number of iterations is not known in advance and depends on a condition.
7. `continue` skips the current iteration and moves to the next loop cycle.
8. `break` exits the loop immediately, even if the loop condition is still true.
9. Example:
```python
numbers = [1, 2, 3]
squares = [x*x for x in numbers]
```
10. `pass` is a no-op statement used as a placeholder where Python syntax requires a statement.
11. `WHERE` filters rows in SQL so only records matching the condition are returned.
12. `DISTINCT` returns only unique values from a column.
13. `ORDER BY` sorts query results by one or more columns.
14. `LIMIT` restricts the number of rows returned by a query.
15. Example:
```sql
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'A%';
```
16. `IN` checks whether a value is equal to any value in a list, e.g. `WHERE department_name IN ('Sales', 'HR')`.
17. `BETWEEN` is useful for range checks and is more concise than `>=` and `<=` combined.
18. Use `IS NULL` to test for missing values and `IS NOT NULL` to test for existing values.
19. `AND` requires both conditions to be true; `OR` requires at least one condition to be true.
20. Pushing filtering to the database reduces the amount of data transferred, uses optimized query execution, and improves overall pipeline performance.
