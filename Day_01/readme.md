# Day 01 — Learning Checklist and Notes

## 📋 Day 1 Checklist

### 🐍 Python
- [ ] Install and verify Python
- [ ] Learn Python execution flow
- [ ] Understand Interpreter, Bytecode, `.pyc`, PVM
- [ ] Learn reference counting and garbage collection
- [ ] Understand the GIL and its implications

### 🗄 SQL
- [ ] Understand SQL architecture
- [ ] Practice `SELECT`, `FROM`, `WHERE`, `ORDER BY`
- [ ] Learn the SQL query execution lifecycle

### 💻 Hands-on Labs
- [ ] Write a Hello World program
- [ ] Practice variables, loops, functions
- [ ] Read a CSV file
- [ ] Read a JSON file
- [ ] Create Employee and Department tables
- [ ] Execute basic SQL queries

### 🤖 AI Enhancement Workflow
- [ ] Ask AI to review your Python code
- [ ] Ask AI to optimize one SQL query
- [ ] Ask AI to explain one error you encounter

### 🛠 AI Agent Milestone
Design the first version of a **Learning Assistant AI Agent** that can:
- Explain Python concepts
- Explain SQL concepts
- Generate quizzes
- Review code
- Explain errors

> No coding required today — focus on the design.

### 📝 Mini Assignment
Build an **Employee Data Analyzer** that:
- Reads employee data from CSV
- Calculates average salary
- Finds the highest salary
- Exports results as JSON

---

## Python Concepts

### Installation and Setup
- Install Python and confirm with `python --version`
- Create a virtual environment:
  ```powershell
  python -m venv .venv
  .\.venv\Scripts\Activate.ps1
  ```
- Install packages with `pip install pandas`

### Execution Flow
- Python source file (`.py`) → interpreter
- Interpreter compiles source to bytecode
- Bytecode is stored in `.pyc` files inside `__pycache__`
- Python Virtual Machine (PVM) executes bytecode

### Memory and Performance
- Reference counting tracks live objects
- Garbage collector handles cyclic references
- GIL (Global Interpreter Lock) allows one native thread to execute Python bytecode at a time
- GIL affects CPU-bound multi-threaded workloads, but not I/O-bound programs as much

### Core Python Topics for Day 1
- Variables and data types
- Control flow: `if`, `for`, `while`
- Functions and return values
- File I/O with CSV and JSON
- Working with standard libraries: `os`, `pathlib`, `json`, `csv`

---

## SQL Concepts

### SQL Architecture
- Understand how SQL is parsed, optimized, and executed
- Know the roles of: parser, optimizer, query engine, storage layer

### Basic SQL Patterns
- `SELECT` columns
- `FROM` tables
- `WHERE` filters
- `ORDER BY` sorting

### Query Execution Lifecycle
- Parse SQL statement
- Validate syntax and object names
- Build the query plan
- Optimize the plan
- Execute and return results

### Practice Queries
```sql
SELECT employee_id, first_name, last_name, salary
FROM Employee
WHERE salary > 50000
ORDER BY salary DESC;
```

```sql
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM Department d
JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.department_name;
```

---

## Hands-on Labs

### Hello World
```python
print('Hello, World!')
```

### Variables, Loops, and Functions
```python
def average(numbers):
    return sum(numbers) / len(numbers)

values = [100, 200, 300]
print('Average:', average(values))
```

### Read a CSV file
```python
import csv

with open('data/employees.csv', mode='r', newline='', encoding='utf-8') as file:
    reader = csv.DictReader(file)
    for row in reader:
        print(row)
```

### Read a JSON file
```python
import json

with open('data/employees.json', 'r', encoding='utf-8') as file:
    data = json.load(file)
    print(data)
```

### Employee and Department Tables
- Employee columns: `employee_id`, `first_name`, `last_name`, `department_id`, `salary`
- Department columns: `department_id`, `department_name`

Example table creation for SQL practice:
```sql
CREATE TABLE Department (
    department_id INT,
    department_name VARCHAR(100)
);

CREATE TABLE Employee (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);
```

---

## Employee Data Analyzer Notes

### Goal
Create a script that loads employee data from a CSV file, calculates the average salary, finds the highest salary, and writes the results to JSON.

### Steps
1. Read `employees.csv` using `csv.DictReader` or `pandas`.
2. Convert salary values to numbers.
3. Calculate:
   - `average_salary`
   - `max_salary`
   - `highest_paid_employee`
4. Write the result to `report.json`.

### Example output structure
```json
{
  "average_salary": 75600.50,
  "max_salary": 120000.00,
  "highest_paid_employee": {
    "employee_id": 101,
    "first_name": "Alex",
    "last_name": "Taylor",
    "salary": 120000.00
  }
}
```

---

## AI Enhancement Workflow

### Use AI for:
- Reviewing your Python code and suggesting improvements
- Optimizing a SQL query
- Explaining any errors or stack traces you encounter

### Design Notes
- Define the AI assistant's capabilities clearly
- Focus on Python and SQL explanation first
- Include quiz generation and code review features
- Capture error explanations as part of the design

---

## Next Steps
- Add your CSV and JSON sample files to `Day_01/data/`
- Update the sample program in `Day_01/Python/First_program.py`
- Use this file as your Day 1 study guide for notes and practice

---

## Day 1 Files

- `notes.md` — Day 1 study notes and explanations.
- `lab_examples.py` — Python hands-on examples for CSV, JSON, and core concepts.
- `employee_schema.sql` — SQL schema and practice queries.
- `quiz.md` — Practice questions for Day 1.

```
❓Practice Questions (50)
10 Conceptual: Python, interpreter, bytecode, GIL, memory management.
10 SQL: SELECT, WHERE, GROUP BY, ORDER BY, LIMIT, execution lifecycle.
10 Coding: Reverse string, palindrome, Fibonacci, CSV reader, JSON reader, SQL queries.
10 Scenario/Debugging: Slow scripts, duplicate data, missing values, memory issues, SQL errors.
10 Interview/Architecture/Leadership: Explain GIL, SQL execution, Python vs Java, SQL vs NoSQL, mentoring, AI code review.