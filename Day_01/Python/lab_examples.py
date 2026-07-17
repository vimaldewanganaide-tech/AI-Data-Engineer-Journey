"""Day 1 Python lab examples for basic execution, CSV, and JSON."""

import csv
import json
from pathlib import Path

print('Hello, World!')

# Variables and control flow
name = 'Alex'
age = 30

if age >= 18:
    print(f'{name} is an adult')
else:
    print(f'{name} is not an adult')

# Function example

def average(values):
    return sum(values) / len(values)

values = [100, 200, 300]
print('Average:', average(values))

# CSV read example
sample_csv = Path('Day_01/data/employees.csv')

if sample_csv.exists():
    with sample_csv.open('r', newline='', encoding='utf-8') as file:
        reader = csv.DictReader(file)
        for row in reader:
            print(row)
else:
    print(f'CSV file not found: {sample_csv}')

# JSON read/write example
report = {
    'average_salary': 75600.5,
    'max_salary': 120000.0,
    'highest_paid_employee': {
        'employee_id': 101,
        'first_name': 'Alex',
        'last_name': 'Taylor',
        'salary': 120000.0,
    },
}

output_json = Path('Day_01/report.json')
with output_json.open('w', encoding='utf-8') as file:
    json.dump(report, file, indent=2)

print('Wrote report to', output_json)

# Example of reading the report back
with output_json.open('r', encoding='utf-8') as file:
    loaded = json.load(file)
    print('Loaded report:', loaded)
