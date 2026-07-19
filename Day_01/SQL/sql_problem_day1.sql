-- Active: 1784310423164@@localhost@3306@mysql
--employee(employee_id,first_name,last_name,email,hire_date,job_title,salary,department_id,manager_id )
--department(department_id,department_name,location)

--Basics — SELECT, WHERE, ORDER BY (1–10)
-- 1. List all employees' first name, last name, and salary.
select first_name, last_name, salary from employee;
-- 2. Find all employees who work in department 20 (Engineering).
select * from employee where department_id = 20;
-- 3. List employees hired after January 1, 2020.
select * from employee where hire_date > '2020-01-01';
-- 4. Find employees with a salary greater than 80,000.
select * from employee where salary > 80000;
-- 5. List all employees whose job title contains "Manager".
select * from employee where job_title like '%manager%';
-- 6. Find employees located in "Seattle" (via department).
select e.* from employee e join department d on e.department_id = d.department_id where d.location = 'Seattle';
-- 7. List all employees ordered by salary in descending order.
select * from employee order by salary desc;
-- 8. Find employees whose first name starts with "J".
select * from employee where first_name like 'J%';
-- 9. List employees with no manager (top-level managers).
select * from employee where manager_id is null;
-- 10. Find the employee with the highest salary.
select * from employee where salary = (select max(salary) from employee);

-- Aggregate Functions (11–20)
-- 11. Count the total number of employees.
select count(*) from employee;
-- 12. Count the number of departments.
select count(*) from department;
-- 13. Find the average salary of all employees.
select avg(salary) from employee;
-- 14. Find the minimum and maximum salary in the company.
select min(salary), max(salary) from employee;
-- 15. Find the total salary paid out per department.
select department_id, sum(salary) from employee group by department_id;
-- 16. Count the number of employees in each department.
select department_id, count(*) from employee group by department_id;
--17. Find the average salary per department.
select department_id, avg(salary) from employee group by department_id;
-- 18. Find the department with the highest average salary.
select department_id, avg(salary) as avg_salary from employee group by department_id order by avg_salary desc limit 1;
-- 19. Find the number of employees hired each year.
select year(hire_date) as hire_year, count(*) from employee group by year(hire_date);
-- 20. Find the highest-paid employee in each department.
select e1.* from employee e1 join (select department_id, max(salary) as max_salary from employee group by department_id) e2 on e1.department_id = e2.department_id and e1.salary = e2.max_salary;

-- GROUP BY / HAVING (21–29)
-- 21. List departments having more than 8 employees.
select department_id, count(*) as employee_count from employee group by department_id having employee_count > 8;
-- 22. List departments whose average salary exceeds 70,000.
select department_id, avg(salary) as avg_salary from employee group by department_id having avg_salary > 70000;
-- 23. Find job titles with more than 3 employees.
select job_title, count(*) as employee_count from employee group by job_title having employee_count > 3;
-- 24. Find departments where total salary exceeds 500,000.
select department_id, sum(salary) as total_salary from employee group by department_id having total_salary > 500000;
-- 25. List the number of distinct job titles per department.   
select department_id, count(distinct job_title) as distinct_job_titles from employee group by department_id;
-- 26. Find managers who have more than 5 direct reports.
select manager_id, count(*) as direct_reports from employee where manager_id is not null group by manager_id having direct_reports > 5; 
-- 27. Find the earliest and latest hire date per department.
select department_id, min(hire_date) as earliest_hire, max(hire_date) as latest_hire from employee group by department_id;
-- 28. List departments with a salary range (max−min) greater than 30,000.
select department_id, (max(salary) - min(salary)) as salary_range from employee group by department_id having salary_range > 30000;
-- 29. find mangaer name with maximum number of direct reports
select e1.manager_id,e2.first_name, e2.last_name, count(*) as direct_reports from employee e1 join employee e2 on e1.manager_id = e2.employee_id group by e1.manager_id order by direct_reports desc limit 1;

-- JOINs (30–39)
-- 30. List each employee along with their department name.
select e.first_name, e.last_name, d.department_name from employee e join department d on e.department_id = d.department_id;
-- 31. List each employee along with their manager's name (self-join).
select e1.first_name as employee_first_name, e1.last_name as employee_last_name, e2.first_name as manager_first_name, e2.last_name as manager_last_name from employee e1 left join employee e2 on e1.manager_id = e2.employee_id;
-- 32. Find all departments that currently have zero employees (if any), using LEFT JOIN.
select d.department_name from department d left join employee e on d.department_id = e.department_id where e.employee_id is null;
-- 33. List employees and department location together.
select e.first_name, e.last_name, d.location from employee e join department d on e.department_id = d.department_id;
-- 34. Find employees who work in the same department as "Engineering".
select e.* from employee e join department d on e.department_id = d.department_id where d.department_name = 'Engineering';      
-- 35. List each manager along with the count of their direct reports.
select e2.first_name, e2.last_name, count(e1.employee_id) as direct_reports from employee e1 join employee e2 on e1.manager_id = e2.employee_id group by e2.employee_id;
-- 36. Find employees earning more than their manager.
select e1.first_name, e1.last_name, e1.salary, e2.first_name as manager_first_name, e2.last_name as manager_last_name, e2.salary as manager_salary from employee e1 join employee e2 on e1.manager_id = e2.employee_id where e1.salary > e2.salary;
-- 37. List department name, employee name, and salary sorted by department then salary descending.
select d.department_name, e.first_name, e.last_name, e.salary from employee e join department d on e.department_id = d.department_id order by d.department_name, e.salary desc;
-- 38. Find the manager name for each employee in the Sales department.
select e1.first_name as employee_first_name, e1.last_name as employee_last_name, e2.first_name as manager_first_name, e2.last_name as manager_last_name from employee e1 join employee e2 on e1.manager_id = e2.employee_id join department d on e1.department_id = d.department_id where d.department_name = 'Sales';
-- 39. List all employee-manager pairs where both work in different departments (shouldn't normally happen — validate data integrity).
select e1.first_name as employee_first_name, e1.last_name as employee_last_name, d1.department_name as employee_department, e2.first_name as manager_first_name, e2.last_name as manager_last_name, d2.department_name as manager_department from employee e1 join employee e2 on e1.manager_id = e2.employee_id join department d1 on e1.department_id = d1.department_id join department d2 on e2.department_id = d2.department_id where d1.department_id != d2.department_id;


-- Subqueries (40–46)
-- 40. Find employees who earn more than the company average salary.
select * from employee where salary > (select avg(salary) from employee);
-- 41. Find employees who earn more than their department's average salary.
select * from employee e1 where salary > (select avg(salary) from employee e2 where e2.department_id = e1.department_id);
-- 42. Find the department(s) with the maximum average salary using a subquery.
select department_id from employee group by department_id having avg(salary) = (select max(avg_salary) from (select avg(salary) as avg_salary from employee group by department_id) as dept_avg);
-- 43. Find employees who are not managers (i.e., no one reports to them).
select * from employee where employee_id not in (select distinct manager_id from employee where manager_id is not null);
-- 44. Find the second-highest salary in the company.
select distinct salary from employee order by salary desc limit 1 offset 1; 
-- 45. Find employees hired in the same year as the most recently hired employee.
select * from employee where year(hire_date) = (select year(max(hire_date)) from employee);
-- 46. List departments where the average salary is above the overall company average.  
select department_id from employee group by department_id having avg(salary) > (select avg(salary) from employee);  

-- Advanced / Window Functions (47–51)
-- 47. Rank employees by salary within each department (RANK() OVER (PARTITION BY department_id ORDER BY salary DESC)).
select employee_id, first_name, last_name, department_id, salary, RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) as salary_rank from employee;
-- 48. Find the top 3 highest-paid employees in each department.
select * from (select employee_id, first_name, last_name, department_id, salary, ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) as row_num from employee) ranked where row_num <= 3;
-- 49. Calculate a running total of salaries ordered by hire_date.
select employee_id, first_name, last_name, hire_date, salary, SUM(salary) OVER (ORDER BY hire_date) as running_total from employee;
-- 50. Find the difference between each employee's salary and their department's average salary.
select employee_id, first_name, last_name, department_id, salary, salary - (select avg(salary) from employee e2 where e2.department_id = e1.department_id) as salary_diff from employee e1;
-- 51. Find each employee's salary rank company-wide and their department-wide rank side by side.
select employee_id, first_name, last_name, department_id, salary, RANK() OVER (ORDER BY salary DESC) as company_rank, RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) as dept_rank from employee; 

-- Basics — JOINs across 3 tables (52–59)
-- 52. List all projects along with their department name
select p.project_name, d.department_name from project p join department d on p.department_id = d.department_id;
-- 53. List all employees along with the projects their department is running
select e.first_name, e.last_name, p.project_name from employee e join project p on e.department_id = p.department_id;
-- 54. Find all projects run by the "Engineering" department
select p.* from project p join department d on p.department_id = d.department_id where d.department_name = 'Engineering';
-- 55. List department name, project name, and budget together, sorted by budget descending
select d.department_name, p.project_name, p.budget from department d join project p on d.department_id = p.department_id order by p.budget desc;        
-- 56. Find employees who belong to a department currently running more than one project
-- 57. List all projects that started in 2023
-- 58. Find projects with no end date (ongoing projects, if any)
-- 59. List departments that have no projects assigned (LEFT JOIN / NOT EXISTS)

-- Aggregates on Projects (59–68)
-- 60. Find the total budget allocated across all projects
-- 61. Find the total project budget per department
-- 62. Find the average project budget per department
-- 63. Count the number of projects per department
-- 64. Find the department with the highest total project budget
-- 65. Find the project with the highest budget
-- 66. Find the project with the longest duration (end_date - start_date)
-- 67. Find the average project duration across all projects
-- 68. Find departments where total project budget exceeds their total employee salary cost
-- 69. Count how many projects are still active as of today's date (end_date >= CURRENT_DATE)


-- HAVING / Filtering (70–74)
-- 70. List departments with more than 1 project AND average project budget above 100,000.
-- 71. Find projects with a budget above the average budget of all projects.
-- 72. Find departments where every project has a budget greater than 50,000.
-- 73. List the top 3 highest-budget projects company-wide.
-- 74. Find projects that overlap in time with "Cloud Migration" (date range overlap).


-- Advanced — Combining Employee + Department + Project (75–81)
-- 75. For each department, show: employee count, total salary cost, project count, and total project budget — in one query.
-- 76. Find the manager of the department running the "Mobile App Launch" project.
-- 77. Rank departments by total project budget using a window function.
-- 78. Find employees working in departments whose projects have a combined budget over 300,000.
-- 79. Calculate the ratio of total project budget to total department salary cost, per department.
-- 80. Find the department with the best "budget efficiency" (lowest project budget per employee).
-- 81. Write a query that returns department name, number of employees, number of projects, and flags departments as 'Understaffed' if employees < 5 and project count > 1, else 'OK'.
