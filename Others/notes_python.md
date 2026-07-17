# Python Notes

## Beginner

- Python is an interpreted, high-level language with dynamic typing.
- Use variables to store values; naming should follow `snake_case`.
- Primitive types: `int`, `float`, `str`, `bool`.
- Collections:
  - `list`: ordered, mutable sequence.
  - `tuple`: ordered, immutable sequence.
  - `set`: unordered collection of unique items.
  - `dict`: key-value mapping.
- Control flow:
  - `if`, `elif`, `else`
  - `for` loops over iterables
  - `while` for repeated conditions
- Functions:
  - define using `def`
  - parameters, return values, default args
  - use docstrings to document behavior.
- File I/O:
  - `open(..., 'r')`, `open(..., 'w')`
  - `with` automatically closes files
  - `csv` and `json` are standard libraries for structured data.

## Intermediate

- Object identity and `id()`:
  - every value is an object in Python
  - `id(x)` returns the memory identity for the object
  - equality `==` compares values, `is` compares identity
- Mutable vs immutable:
  - mutable objects can change in place (`list`, `dict`, `set`)
  - immutable objects cannot change after creation (`int`, `float`, `str`, `tuple`, `bool`)
  - be careful when using mutable default arguments in functions
- Error handling:
  - `try`, `except`, `finally`, `else`
  - custom exceptions using classes inheriting from `Exception`
- List comprehensions and generator expressions:
  - compact syntax for building lists
  - generators yield values lazily using `()`
- Modules and packages:
  - organize code with `import`
  - create reusable modules and package directories with `__init__.py`
- Standard libraries:
  - `os`, `pathlib`, `datetime`, `collections`, `itertools`

## Advanced

- Object-oriented programming:
  - define classes with `class`
  - use `__init__` for initialization
  - method types: instance, class, static
  - inheritance and composition
- Dataclasses:
  - use `from dataclasses import dataclass`
  - automatic `__init__`, `__repr__`, and equality
  - support default values and type hints
- Type hints and static analysis:
  - annotate variables and function signatures with `typing`
  - use `mypy` or VS Code type checking
- Performance and optimization:
  - profiling with `cProfile`, `timeit`
  - use `collections.deque` for fast queue operations
  - avoid excessive copying for large data
- Concurrency and parallelism:
  - `threading` for I/O-bound tasks
  - `multiprocessing` for CPU-bound tasks
  - asynchronous programming with `async` / `await`
- Packaging and distribution:
  - create `requirements.txt`
  - use `pip` and `setuptools`
  - publish packages with `wheel` and `twine`

## Tips for smooth learning

- Practice by building small projects.
- Read official docs and write code regularly.
- Experiment with both built-in and third-party libraries.
- Use version control and keep notes on new patterns.

## Topic Deep Dives

### Python (Advanced)

Advanced Python covers idiomatic patterns, introspection, and language internals.

Example 1: unpacking and extended iterable unpacking
```python
values = [1, 2, 3, 4, 5]
a, *middle, b = values
print(a, middle, b)  # 1 [2, 3, 4] 5
```
Example 2: using `__slots__` to reduce memory overhead
```python
class Point:
    __slots__ = ('x', 'y')
    def __init__(self, x, y):
        self.x = x
        self.y = y
```
Example 3: metaprogramming with `getattr` and dynamic attributes
```python
class Config:
    def __init__(self, data):
        self._data = data
    def __getattr__(self, name):
        return self._data.get(name)
```

### OOP

Object-oriented programming helps model real-world entities and relationships.

Example 1: class with instance methods
```python
class Student:
    def __init__(self, first_name, last_name):
        self.first_name = first_name
        self.last_name = last_name
    def full_name(self):
        return f'{self.first_name} {self.last_name}'
```
Example 2: inheritance and method overriding
```python
class Person:
    def greet(self):
        return 'Hello'
class Teacher(Person):
    def greet(self):
        return 'Hello, I am your teacher'
```
Example 3: composition to reuse behavior
```python
class Address:
    def __init__(self, city):
        self.city = city
class Employee:
    def __init__(self, name, address):
        self.name = name
        self.address = address
```

### NumPy

NumPy enables fast numerical computation with arrays and vectorized operations.

Example 1: create arrays and perform arithmetic
```python
import numpy as np
arr = np.array([1, 2, 3])
print(arr * 2)  # [2 4 6]
```
Example 2: compute statistics on arrays
```python
arr = np.array([10, 20, 30, 40])
print(arr.mean(), arr.std())
```
Example 3: use boolean masking
```python
arr = np.array([1, 5, 10, 15])
print(arr[arr > 5])  # [10 15]
```

### Pandas

Pandas simplifies data analysis with DataFrames and Series.

Example 1: load CSV into a DataFrame
```python
import pandas as pd
df = pd.read_csv('data/employees.csv')
print(df.head())
```
Example 2: filter and aggregate data
```python
high_salary = df[df['salary'] > 80000]
print(high_salary[['first_name', 'salary']])
```
Example 3: groupby and summary statistics
```python
summary = df.groupby('department')['salary'].mean()
print(summary)
```

### PySpark

PySpark offers distributed processing for large datasets using Spark.

Example 1: create a Spark DataFrame
```python
from pyspark.sql import SparkSession
spark = SparkSession.builder.appName('example').getOrCreate()
df = spark.createDataFrame(
    [(1, 'Alice', 80000), (2, 'Bob', 65000)],
    ['id', 'name', 'salary']
)
df.show()
```
Example 2: filter and select columns
```python
result = df.filter(df.salary > 70000).select('name', 'salary')
result.show()
```
Example 3: aggregation with Spark SQL functions
```python
from pyspark.sql.functions import avg
avg_salary = df.select(avg('salary')).collect()[0][0]
print(avg_salary)
```

### Advanced Python

Advanced Python includes decorators, context managers, and async programming.

Example 1: a decorator to time a function
```python
import time

def timer(func):
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        print('Elapsed:', time.time() - start)
        return result
    return wrapper

@timer
def compute():
    return sum(range(1000000))
```
Example 2: custom context manager with `contextlib`
```python
from contextlib import contextmanager

@contextmanager
def open_file(path):
    f = open(path, 'r')
    try:
        yield f
    finally:
        f.close()
```
Example 3: simple async function
```python
import asyncio

async def fetch():
    await asyncio.sleep(1)
    return 'done'

async def main():
    result = await fetch()
    print(result)

asyncio.run(main())
```

### Testing

Testing ensures code works correctly and continues to work during change.

Example 1: simple unit test with `pytest`
```python
def add(a, b):
    return a + b

def test_add():
    assert add(2, 3) == 5
```
Example 2: test a function that raises an error
```python
import pytest

def divide(a, b):
    if b == 0:
        raise ValueError('division by zero')
    return a / b

def test_divide_by_zero():
    with pytest.raises(ValueError):
        divide(5, 0)
```
Example 3: use fixtures for shared setup
```python
import pytest

@ pytest.fixture
def sample_list():
    return [1, 2, 3]

def test_sample(sample_list):
    assert sum(sample_list) == 6
```

### Performance Optimization

Performance optimization improves speed and memory usage.

Example 1: use list comprehensions instead of loops
```python
nums = [i for i in range(1000000)]
squares = [x * x for x in nums]
```
Example 2: use `join` for string concatenation
```python
words = ['a', 'b', 'c']
text = ' '.join(words)
```
Example 3: avoid repeated work with caching
```python
cache = {}
def fib(n):
    if n in cache:
        return cache[n]
    if n < 2:
        return n
    cache[n] = fib(n-1) + fib(n-2)
    return cache[n]
```
