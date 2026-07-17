"""Employee Analytics application for Day 03."""

import csv
from collections import defaultdict
from pathlib import Path

INPUT_PATH = Path('Day_03/sample_data.csv')
OUTPUT_PATH = Path('Day_03/employee_summary.csv')


def read_employees(path):
    employees = []
    with path.open('r', encoding='utf-8') as file:
        reader = csv.DictReader(file)
        for row in reader:
            row['salary'] = float(row['salary'])
            row['department_id'] = int(row['department_id'])
            employees.append(row)
    return employees


def department_averages(employees):
    totals = defaultdict(float)
    counts = defaultdict(int)
    for emp in employees:
        totals[emp['department_name']] += emp['salary']
        counts[emp['department_name']] += 1
    return {dept: totals[dept] / counts[dept] for dept in totals}


def top_earners(employees, n=3):
    return sorted(employees, key=lambda e: e['salary'], reverse=True)[:n]


def write_summary(path, averages):
    fieldnames = ['department_name', 'average_salary']
    with path.open('w', newline='', encoding='utf-8') as file:
        writer = csv.DictWriter(file, fieldnames=fieldnames)
        writer.writeheader()
        for dept, avg in averages.items():
            writer.writerow({'department_name': dept, 'average_salary': f'{avg:.2f}'})


def main():
    employees = read_employees(INPUT_PATH)
    averages = department_averages(employees)
    top_employees = top_earners(employees, n=3)

    print('Department averages:')
    for dept, avg in averages.items():
        print(f'- {dept}: ${avg:.2f}')

    print('\nTop earners:')
    for emp in top_employees:
        print(f"- {emp['first_name']} {emp['last_name']} ({emp['department_name']}): ${emp['salary']:.2f}")

    write_summary(OUTPUT_PATH, averages)
    print(f'Wrote summary to {OUTPUT_PATH}')


if __name__ == '__main__':
    main()
