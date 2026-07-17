# Day 1 Quiz Answers

## 1. What command verifies the installed Python version?

Theory:
The command checks the current Python interpreter available on your system. It helps confirm the version before running code or creating environments.

Example:
```bash
python --version
```
or
```bash
python3 --version
```

## 2. What is the purpose of a virtual environment?

Theory:
A virtual environment isolates a project's Python dependencies from other projects and the global Python installation. This prevents package version conflicts and keeps project environments reproducible.

Example:
```powershell
python -m venv .venv
```
Then activate it:
```powershell
.\.venv\Scripts\Activate.ps1
```

## 3. What file extension does Python bytecode use in `__pycache__`?

Theory:
Python compiles `.py` source files to bytecode for faster execution. These compiled files are stored in the `__pycache__` directory using the `.pyc` extension.

Example:
If your script is `example.py`, the compiled file becomes `__pycache__/example.cpython-310.pyc`.

## 4. Explain the Python execution flow from source to PVM.

Theory:
Python source code is first parsed into an abstract syntax tree (AST). Then it is compiled into bytecode instructions. The Python Virtual Machine (PVM) executes the bytecode step by step. `__pycache__` stores compiled bytecode so future runs can be faster.

Example workflow:
- `example.py` (source)
- compile to `example.pyc` (bytecode)
- PVM executes bytecode using the interpreter loop

## 5. Why does Python use reference counting?

Theory:
Reference counting is a memory management technique that tracks how many references point to each object. When the reference count reaches zero, the object can be freed immediately. This helps avoid memory leaks for most objects.

Example:
```python
a = [1, 2, 3]
b = a
```
The list has a reference count of at least 2 because both `a` and `b` refer to it.

## 6. What does the GIL do?

Theory:
The Global Interpreter Lock (GIL) is a mutex that allows only one thread to execute Python bytecode at a time in CPython. It simplifies memory management and reference counting but limits CPU-bound concurrency within a single process.

Example:
Multi-threaded Python code may not run faster for CPU-heavy tasks due to the GIL, but it can still improve I/O-bound programs.

## 7. Name three Python standard libraries used for file I/O.

Theory:
Python includes built-in modules for reading and writing files, structured data, and filesystem operations.

Examples:
- `csv` for CSV files
- `json` for JSON files
- `os` for file paths and filesystem operations
- `pathlib` for object-oriented path handling (bonus)

## 8. What SQL clause selects rows from a table?

Theory:
The `SELECT` clause is used to specify the columns to return from a table. It is the main entry point for reading data in SQL.

Example:
```sql
SELECT first_name, last_name
FROM Employee;
```

## 9. How do you filter rows in SQL?

Theory:
The `WHERE` clause is used to filter rows that meet a condition. It appears after `FROM` and before ordering or grouping.

Example:
```sql
SELECT *
FROM Employee
WHERE salary > 60000;
```

## 10. What is the purpose of `ORDER BY`?

Theory:
`ORDER BY` sorts the query output by one or more columns, either ascending (`ASC`) or descending (`DESC`). It helps present results in a defined order.

Example:
```sql
SELECT first_name, salary
FROM Employee
ORDER BY salary DESC;
```

## 11. What is a primary key in a SQL table?

Theory:
A primary key uniquely identifies each row in a table. It enforces uniqueness and non-null values, making it suitable for record lookup and joining.

Example:
```sql
CREATE TABLE Employee (
  employee_id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT
);
```

## 12. What does `FOREIGN KEY` enforce?

Theory:
A foreign key enforces referential integrity between tables by ensuring values in one table match values in another table's primary key or unique column.

Example:
```sql
CREATE TABLE Department (
  department_id INTEGER PRIMARY KEY,
  department_name TEXT
);

CREATE TABLE Employee (
  employee_id INTEGER PRIMARY KEY,
  department_id INTEGER,
  FOREIGN KEY (department_id) REFERENCES Department(department_id)
);
```

## 13. How do you read JSON data in Python?

Theory:
Use the `json` module to parse JSON text into Python data structures like dictionaries and lists.

Example:
```python
import json
with open('employees.json', 'r', encoding='utf-8') as f:
    data = json.load(f)
```

## 14. How do you write JSON data in Python?

Theory:
Use `json.dump()` to serialize Python objects to JSON and write them to a file.

Example:
```python
import json
data = {'avg_salary': 75000}
with open('report.json', 'w', encoding='utf-8') as f:
    json.dump(data, f, indent=2)
```

## 15. When should you use `csv.DictReader` instead of `csv.reader`?

Theory:
`csv.DictReader` reads CSV rows as dictionaries keyed by column names, making code easier to read and maintain when working with labeled data. `csv.reader` returns each row as a list.

Example:
```python
import csv
with open('employees.csv', 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        print(row['first_name'], row['salary'])

  ## 16. Difference between a compiler and an interpreter

  Theory:
  A compiler translates entire source code written in a high-level language into machine code (native instructions) or an intermediate form before execution. Compilation is typically a separate step that produces an executable or an artifact (binary, bytecode). An interpreter reads source code (or an intermediate representation) and executes it directly, translating on the fly.

  Key differences:
  - When translation happens: compilers translate ahead-of-time (AOT) before running; interpreters translate and execute line-by-line or by executing bytecode at runtime.
  - Output: compilers produce standalone executables or bytecode files; interpreters generally do not (although some create bytecode caches, e.g., CPython's `.pyc`).
  - Performance: compiled native code usually runs faster because it is optimized for the target CPU; interpreted code has runtime overhead. JITs (Just-In-Time compilers) blur this line by compiling hot paths at runtime (e.g., PyPy, JVM).
  - Portability: interpreted languages can be more portable because the interpreter abstracts the platform; compiled binaries may be platform-specific unless compiled to portable bytecode.
  - Development workflow: interpreted environments usually allow faster edit-run-debug cycles; compiled languages can have longer build times but may provide ahead-of-time optimizations.

  Examples:
  - C (compiled): `gcc program.c -o program` → produces a native executable `program`.
  - Java (compile to bytecode + JVM interpreter/JIT): `javac Program.java` → `java Program` runs bytecode on the JVM (JIT may compile hot code).
  - Python (CPython): source `.py` is compiled to bytecode (`.pyc`) and executed by the Python Virtual Machine (PVM) — a hybrid model that uses both compilation to bytecode and interpretation by the VM.

  Short code comparison:

  C (compiled):
  ```c
  #include <stdio.h>
  int main() { printf("Hello\n"); return 0; }
  ```

  Python (interpreted/bytecode):
  ```python
  print("Hello")
  ```

  Relevance to data engineering:
  - Use compiled tools or native libraries for CPU-heavy work (e.g., numerical kernels in C/Fortran used by NumPy). For orchestration, ETL, and fast iteration, interpreted languages (Python) are preferred due to ecosystem and productivity.

  Practical note:
  CPython's model (compile-to-bytecode + PVM) gives a balance: faster startup than full AOT compilation and the ability to cache bytecode (`__pycache__`) while keeping the dynamic nature of an interpreted language.

```
