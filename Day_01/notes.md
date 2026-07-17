# Day 1 Notes: Python Setup and SQL Basics

## Python Installation and Setup

- Install Python and verify with `python --version`.
- Create a virtual environment:
  ```powershell
  python -m venv .venv
  .\.venv\Scripts\Activate.ps1
  ```
- Install packages with `pip install pandas` or other libraries.

## Python Execution Flow

- Python source code (`.py`) is parsed and compiled to bytecode.
- Bytecode is stored in `__pycache__` as `.pyc` files.
- The Python Virtual Machine (PVM) executes the bytecode.

## Memory Management

- Python uses reference counting to track object lifetimes.
- The garbage collector handles cyclic references.
- The Global Interpreter Lock (GIL) ensures only one native thread executes Python bytecode at a time.
- The GIL is more important for CPU-bound tasks than for I/O-bound tasks.

## Core Python Concepts for Day 1

- Variables and data types
- Control flow: `if`, `for`, `while`
- Functions and return values
- File I/O with CSV and JSON
- Standard libraries: `os`, `pathlib`, `json`, `csv`

## SQL Basics

- Learn the SQL query structure: `SELECT`, `FROM`, `WHERE`, `ORDER BY`
- Understand query execution steps: parsing, validation, optimization, execution
- Practice using basic SQL queries on sample tables
- Know that SQL runs through parser, optimizer, query engine, and storage layers

## Employee Data Analyzer Design

- Load employee data from CSV
- Calculate average salary
- Find the highest salary
- Export results to JSON

## Example Steps

1. Read `employees.csv` using `csv.DictReader` or `pandas`.
2. Convert salary values from strings to numbers.
3. Compute:
   - `average_salary`
   - `max_salary`
   - `highest_paid_employee`
4. Write results to `report.json`.

## Important Concepts

- `csv.DictReader` creates a dictionary per row
- `json.load()` reads JSON data into Python objects
- `with open(...)` ensures files close automatically
- Use functions to keep logic reusable and testable
