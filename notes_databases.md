# Databases Notes

## Beginner

- A database stores structured data for applications.
- SQL is the language used to query relational databases.
- Key concepts:
  - table: collection of rows
  - column: named field for each table
  - row: a record containing column values
- Common SQL statements:
  - `SELECT` to read data
  - `INSERT` to add rows
  - `UPDATE` to modify rows
  - `DELETE` to remove rows
- Basic filters:
  - `WHERE` selects rows using conditions
  - `ORDER BY` sorts results
  - `LIMIT` restricts row count

## Intermediate

- Data types:
  - numeric: `INTEGER`, `REAL`, `DECIMAL`
  - text: `TEXT`, `VARCHAR`
  - date/time: `DATE`, `TIMESTAMP`
  - boolean: `BOOLEAN`
- Constraints:
  - `PRIMARY KEY`: uniquely identifies each row
  - `UNIQUE`: prevents duplicate values
  - `NOT NULL`: field must have a value
  - `DEFAULT`: value used when none is supplied
  - `CHECK`: enforces a boolean condition
  - `FOREIGN KEY`: enforces referential integrity
- Joins:
  - `INNER JOIN` returns matching rows
  - `LEFT JOIN` includes all left-side rows
  - `RIGHT JOIN` includes all right-side rows
  - `FULL OUTER JOIN` includes rows from both sides
- Aggregations:
  - `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`
  - `GROUP BY` groups rows by columns
  - `HAVING` filters groups
- Normalization:
  - reduce duplication by splitting tables
  - normal forms up to 3NF to organize data

## Advanced

- Query optimization:
  - use indexes for faster lookups
  - avoid full table scans when possible
  - prefer selective predicates in `WHERE`
- Execution plans:
  - inspect query plans with `EXPLAIN`
  - understand join order, index usage, and cost
- Indexing strategies:
  - primary key indexes by default
  - composite indexes for multi-column queries
  - unique indexes for uniqueness constraints
  - avoid over-indexing, which slows writes
- Window functions:
  - `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`
  - `OVER(PARTITION BY ...)` for partitioned calculations
  - `LAG()`, `LEAD()` for row comparisons
- Database design:
  - model entities, relationships, and attributes
  - choose star schema or snowflake schema for analytics
  - support data integrity with keys and constraints

## Notes on NULL

- `NULL` means unknown / missing data.
- `NULL` is not equal to any value, including itself.
- Use `IS NULL` or `IS NOT NULL` to test nullity.
- Be careful with aggregate functions and `NULL` values.
