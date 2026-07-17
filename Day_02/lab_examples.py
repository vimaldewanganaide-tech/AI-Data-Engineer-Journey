"""Day 2 Python lab examples for variables, data types, and identity."""

# Variables and naming conventions
first_name = 'Vimal'
student_count = 45
is_active = True

# Primitive data types
integer_value = 10
float_value = 12.5
string_value = 'Data Engineer'
bool_value = False

# Collections
example_list = [integer_value, float_value, string_value]
example_tuple = (integer_value, float_value, string_value)
example_set = {integer_value, 99, 12}
example_dict = {'name': first_name, 'role': 'student'}

# Mutable vs. immutable examples
mutable_list = [1, 2, 3]
immutable_tuple = (1, 2, 3)
mutable_list.append(4)
# immutable_tuple[0] = 10  # This would raise a TypeError

# Object identity with id()
small_a = 5
small_b = 5
large_a = 1000
large_b = 1000

print('small_a is small_b:', small_a is small_b)
print('large_a is large_b:', large_a is large_b)
print('id(small_a):', id(small_a))
print('id(small_b):', id(small_b))
print('id(large_a):', id(large_a))
print('id(large_b):', id(large_b))

string_a = 'hello'
string_b = 'hello'
print('string_a is string_b:', string_a is string_b)
print('id(string_a):', id(string_a))
print('id(string_b):', id(string_b))

# Type conversion and isinstance()
int_value = int('7')
float_value = float('7.25')
str_value = str(7.25)
bool_value = bool(1)

print('int_value:', int_value, type(int_value))
print('float_value:', float_value, type(float_value))
print('str_value:', str_value, type(str_value))
print('bool_value:', bool_value, type(bool_value))

print('isinstance(int_value, int):', isinstance(int_value, int))
print('isinstance(float_value, float):', isinstance(float_value, float))
print('isinstance(str_value, str):', isinstance(str_value, str))
print('isinstance(bool_value, bool):', isinstance(bool_value, bool))

# Change a mutable object in place
original_list = [1, 2, 3]
print('before:', original_list, id(original_list))
original_list.append(4)
print('after:', original_list, id(original_list))

# Attempt to change an immutable object produces a new object
original_string = 'day2'
print('before:', original_string, id(original_string))
modified_string = original_string.replace('2', '02')
print('after:', modified_string, id(modified_string))

# Use a tuple to show immutability
original_tuple = (1, 2, 3)
print('tuple:', original_tuple, id(original_tuple))
