# Day 2 Notes: Python and SQL Foundations

## Python Variables and Data Types

- Variables store values and have names that should:
  - start with a letter or underscore
  - contain letters, digits, or underscores
  - not use Python keywords
- Primitive data types:
  - `int` for whole numbers
  - `float` for decimals
  - `str` for text
  - `bool` for `True` / `False`

## Collections

- `list`: ordered, mutable sequence
- `tuple`: ordered, immutable sequence
- `set`: unordered collection of unique values
- `dict`: key-value mapping

## Mutable vs. Immutable Objects

- Mutable objects can change after creation: `list`, `dict`, `set`
- Immutable objects cannot change: `int`, `float`, `str`, `tuple`, `bool`
- Example:
  - `a = [1, 2]; a.append(3)` modifies `a`
  - `b = "hello"; b.replace("h", "j")` returns a new string

## Object Identity and `id()`

- `id(x)` returns the unique identity of an object during its lifetime
- Immutable values may share object identities due to interning or caching
- Example:
  - small integers like `5` may point to the same object across variables
  - strings with the same content can also be reused by Python

## Type Conversion and `isinstance()`

- Convert types with `int()`, `float()`, `str()`, `bool()`
- Use `isinstance(value, type)` to verify a value's type
- Example:
  - `isinstance(3, int)` -> `True`
  - `float("3.14")` -> `3.14`

## SQL Data Types and Table Constraints

- Common SQL data types in SQLite:
  - `INTEGER`, `REAL`, `TEXT`, `BLOB`, `NUMERIC`
- Constraints:
  - `PRIMARY KEY`: uniquely identifies each row
  - `FOREIGN KEY`: enforces references between tables
  - `UNIQUE`: prevents duplicate values
  - `NOT NULL`: requires a value
  - `DEFAULT`: supplies a value when none is provided
  - `CHECK`: validates data against an expression

## Understanding `NULL`

- `NULL` means "unknown" or "missing"
- `NULL` is not the same as `0` or an empty string
- Comparisons with `NULL` use `IS NULL` or `IS NOT NULL`

## Student Management System Design

- Goal: store student data in SQLite and support CRUD operations
- Table columns:
  - `student_id`: primary key, auto-increment
  - `first_name`, `last_name`: text, not null
  - `email`: text, not null, unique
  - `enrollment_date`: date string, default today
  - `gpa`: real value, default `0.0`
  - `is_active`: integer flag, default `1`

## Python Dataclasses (Stretch Goal)

- Dataclasses simplify classes that primarily store data
- They automatically generate `__init__`, `__repr__`, and comparison methods
- Use dataclasses for a cleaner `Student` object model

## Learning Takeaways

- Python variables are labels for objects, not boxes with values
- Mutable objects can change in place, while immutable objects create new values
- SQL constraints protect data quality and support reliable schema design
- `NULL` represents missing data and requires careful handling in queries
