"""Day 03 lab examples for Python control flow and SQL filtering."""

# Python operators and conditionals

score = 78
if score >= 90:
    grade = 'A'
elif score >= 80:
    grade = 'B'
elif score >= 70:
    grade = 'C'
else:
    grade = 'D'
print('Grade:', grade)

# Loop examples

for i in range(1, 6):
    if i % 2 == 0:
        print(i, 'is even')
    else:
        print(i, 'is odd')

count = 0
while count < 3:
    print('Count is', count)
    count += 1

# Nested loops and list comprehension
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
flattened = [value for row in matrix for value in row]
print('Flattened matrix:', flattened)

# Break / continue / pass examples
for n in range(1, 10):
    if n == 5:
        print('Break at', n)
        break
    if n % 2 == 0:
        continue
    if n == 3:
        pass
    print('Value:', n)

# Example filtering logic for an employee dataset
employees = [
    {'name': 'Alice', 'salary': 95000, 'dept': 'Engineering'},
    {'name': 'James', 'salary': 83000, 'dept': 'Sales'},
    {'name': 'Maria', 'salary': 105000, 'dept': 'Engineering'},
]

high_earners = [emp for emp in employees if emp['salary'] > 90000]
print('High earners:', high_earners)
