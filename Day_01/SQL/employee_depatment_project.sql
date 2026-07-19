-- ====================================================
-- SQL Practice: Department and Employee Tables
-- SQL Practice: Project Table (linked to Department)
-- ====================================================

-- Drop tables if they exist (clean re-run)
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS project;

-- ============================================
-- DDL: Department Table
-- ============================================
CREATE TABLE department (
    department_id   INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location        VARCHAR(100)
);

-- ============================================
-- DDL: Employee Table
-- ============================================
CREATE TABLE employee (
    employee_id     INT PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    email           VARCHAR(150) UNIQUE NOT NULL,
    hire_date       DATE NOT NULL,
    job_title       VARCHAR(100),
    salary          DECIMAL(10,2),
    department_id   INT,
    manager_id      INT,
    CONSTRAINT fk_employee_department FOREIGN KEY (department_id) REFERENCES department(department_id),
    CONSTRAINT fk_employee_manager FOREIGN KEY (manager_id) REFERENCES employee(employee_id)
);

-- ============================================
-- DDL: Project Table
-- ============================================
CREATE TABLE project (
    project_id      INT PRIMARY KEY,
    project_name    VARCHAR(150) NOT NULL,
    department_id   INT,
    start_date      DATE NOT NULL,
    end_date        DATE,
    budget          DECIMAL(12,2),
    CONSTRAINT fk_project_department FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- ============================================
-- DML: Department Data
-- ============================================
INSERT INTO department (department_id, department_name, location) VALUES
(10, 'Human Resources', 'New York'),
(20, 'Engineering', 'San Francisco'),
(30, 'Sales', 'Chicago'),
(40, 'Marketing', 'Austin'),
(50, 'Finance', 'Boston'),
(60, 'Information Technology', 'Seattle'),
(70, 'Operations', 'Denver'),
(80, 'Customer Support', 'Atlanta'),
(90, 'Legal', 'Washington DC'),
(100, 'Research and Development', 'San Diego');

-- ============================================
-- DML: Employee Data (105 records)
-- ============================================
INSERT INTO employee (employee_id, first_name, last_name, email, hire_date, job_title, salary, department_id, manager_id) VALUES
(1001, 'Samantha', 'Davis', 'samantha.davis@company.com', '2010-12-09', 'HR Manager', 106049.00, 10, NULL),
(1002, 'Mark', 'Rodriguez', 'mark.rodriguez@company.com', '2011-11-24', 'Engineering Manager', 125741.00, 20, NULL),
(1003, 'Barbara', 'Nguyen', 'barbara.nguyen@company.com', '2016-01-01', 'Sales Representative', 96140.00, 30, NULL),
(1004, 'Margaret', 'Anderson', 'margaret.anderson@company.com', '2018-10-01', 'Marketing Specialist', 126781.00, 40, NULL),
(1005, 'Betty', 'Rivera', 'betty.rivera@company.com', '2018-07-08', 'Financial Analyst', 119439.00, 50, NULL),
(1006, 'Pamela', 'Moore', 'pamela.moore@company.com', '2010-03-23', 'System Administrator', 117696.00, 60, NULL),
(1007, 'Carol', 'Moore', 'carol.moore@company.com', '2012-04-25', 'Operations Manager', 112059.00, 70, NULL),
(1008, 'Susan', 'Garcia', 'susan.garcia@company.com', '2016-02-12', 'Customer Success Manager', 112541.00, 80, NULL),
(1009, 'Nicole', 'Taylor', 'nicole.taylor@company.com', '2010-12-15', 'Legal Counsel', 125142.00, 90, NULL),
(1010, 'Jessica', 'Harris', 'jessica.harris@company.com', '2011-09-10', 'Research Scientist', 131198.00, 100, NULL),
(1011, 'George', 'Torres', 'george.torres@company.com', '2018-12-03', 'Research Scientist', 88336.00, 100, 1010),
(1012, 'Jerry', 'Jackson', 'jerry.jackson@company.com', '2016-04-28', 'Marketing Specialist', 69911.00, 40, 1004),
(1013, 'Ryan', 'Green', 'ryan.green@company.com', '2020-03-12', 'Finance Manager', 58730.00, 50, 1005),
(1014, 'Rachel', 'Baker', 'rachel.baker@company.com', '2016-10-21', 'Accountant', 80005.00, 50, 1005),
(1015, 'Christopher', 'Robinson', 'christopher.robinson@company.com', '2021-05-21', 'Marketing Manager', 89866.00, 40, 1004),
(1016, 'Jerry', 'Roberts', 'jerry.roberts@company.com', '2015-04-27', 'System Administrator', 65673.00, 60, 1006),
(1017, 'Paul', 'Jones', 'paul.jones@company.com', '2018-10-23', 'Logistics Coordinator', 58934.00, 70, 1007),
(1018, 'Ronald', 'Adams', 'ronald.adams@company.com', '2022-03-09', 'Support Representative', 61162.00, 80, 1008),
(1019, 'Jonathan', 'Taylor', 'jonathan.taylor@company.com', '2024-07-19', 'Paralegal', 68723.00, 90, 1009),
(1020, 'Sarah', 'Allen', 'sarah.allen@company.com', '2022-02-25', 'Marketing Specialist', 52185.00, 40, 1004),
(1021, 'Benjamin', 'Hernandez', 'benjamin.hernandez@company.com', '2021-10-03', 'Sales Analyst', 70009.00, 30, 1003),
(1022, 'Cynthia', 'King', 'cynthia.king@company.com', '2019-09-28', 'Research Scientist', 89583.00, 100, 1010),
(1023, 'Debra', 'Wright', 'debra.wright@company.com', '2019-11-11', 'Software Engineer', 64234.00, 20, 1002),
(1024, 'Christopher', 'Robinson', 'christopher.robinson1024@company.com', '2015-12-24', 'Logistics Coordinator', 77806.00, 70, 1007),
(1025, 'Nicholas', 'Miller', 'nicholas.miller@company.com', '2019-11-17', 'Sales Manager', 55016.00, 30, 1003),
(1026, 'Ruth', 'Hernandez', 'ruth.hernandez@company.com', '2023-09-01', 'IT Support Specialist', 77021.00, 60, 1006),
(1027, 'Joseph', 'White', 'joseph.white@company.com', '2019-04-02', 'HR Specialist', 82182.00, 10, 1001),
(1028, 'David', 'Campbell', 'david.campbell@company.com', '2022-02-25', 'Engineering Manager', 53241.00, 20, 1002),
(1029, 'Gregory', 'Walker', 'gregory.walker@company.com', '2023-03-09', 'Sales Analyst', 58880.00, 30, 1003),
(1030, 'Dennis', 'Campbell', 'dennis.campbell@company.com', '2018-12-10', 'Paralegal', 89019.00, 90, 1009),
(1031, 'Jeffrey', 'King', 'jeffrey.king@company.com', '2022-02-08', 'Network Engineer', 49196.00, 60, 1006),
(1032, 'John', 'Nguyen', 'john.nguyen@company.com', '2023-04-19', 'Network Engineer', 45471.00, 60, 1006),
(1033, 'Frank', 'Green', 'frank.green@company.com', '2015-04-03', 'Software Engineer', 66654.00, 20, 1002),
(1034, 'Shirley', 'Thomas', 'shirley.thomas@company.com', '2019-11-16', 'Senior Software Engineer', 80339.00, 20, 1002),
(1035, 'Raymond', 'Torres', 'raymond.torres@company.com', '2024-08-08', 'Sales Analyst', 71677.00, 30, 1003),
(1036, 'Richard', 'Miller', 'richard.miller@company.com', '2021-06-14', 'SEO Analyst', 75606.00, 40, 1004),
(1037, 'Alexander', 'Adams', 'alexander.adams@company.com', '2016-01-13', 'Recruiter', 52161.00, 10, 1001),
(1038, 'Matthew', 'Gonzalez', 'matthew.gonzalez@company.com', '2023-08-05', 'SEO Analyst', 57025.00, 40, 1004),
(1039, 'Cynthia', 'Thomas', 'cynthia.thomas@company.com', '2016-08-26', 'Financial Analyst', 48315.00, 50, 1005),
(1040, 'Mary', 'Garcia', 'mary.garcia@company.com', '2018-03-14', 'Paralegal', 76546.00, 90, 1009),
(1041, 'Stephanie', 'Brown', 'stephanie.brown@company.com', '2017-07-01', 'SEO Analyst', 62380.00, 40, 1004),
(1042, 'Andrew', 'Ramirez', 'andrew.ramirez@company.com', '2023-11-23', 'Support Team Lead', 55144.00, 80, 1008),
(1043, 'Donna', 'Wilson', 'donna.wilson@company.com', '2015-10-24', 'Marketing Specialist', 94019.00, 40, 1004),
(1044, 'Linda', 'Brown', 'linda.brown@company.com', '2024-08-17', 'Network Engineer', 48727.00, 60, 1006),
(1045, 'David', 'Lopez', 'david.lopez@company.com', '2016-10-03', 'Compliance Officer', 60414.00, 90, 1009),
(1046, 'Jessica', 'Torres', 'jessica.torres@company.com', '2018-10-20', 'Operations Manager', 85591.00, 70, 1007),
(1047, 'Rebecca', 'Nelson', 'rebecca.nelson@company.com', '2024-10-17', 'QA Engineer', 62089.00, 20, 1002),
(1048, 'Christine', 'Rivera', 'christine.rivera@company.com', '2020-04-09', 'SEO Analyst', 53577.00, 40, 1004),
(1049, 'Ryan', 'Lee', 'ryan.lee@company.com', '2016-01-15', 'Financial Analyst', 49801.00, 50, 1005),
(1050, 'Margaret', 'Allen', 'margaret.allen@company.com', '2019-03-12', 'Legal Counsel', 61009.00, 90, 1009),
(1051, 'Andrew', 'Hernandez', 'andrew.hernandez@company.com', '2022-09-23', 'IT Support Specialist', 85086.00, 60, 1006),
(1052, 'Mary', 'Nelson', 'mary.nelson@company.com', '2023-05-22', 'Legal Counsel', 53800.00, 90, 1009),
(1053, 'Joseph', 'Miller', 'joseph.miller@company.com', '2023-03-09', 'Finance Manager', 84638.00, 50, 1005),
(1054, 'Catherine', 'Perez', 'catherine.perez@company.com', '2018-11-21', 'Content Strategist', 78122.00, 40, 1004),
(1055, 'Steven', 'Brown', 'steven.brown@company.com', '2016-11-14', 'Support Team Lead', 47889.00, 80, 1008),
(1056, 'Kevin', 'Roberts', 'kevin.roberts@company.com', '2017-11-09', 'HR Specialist', 93577.00, 10, 1001),
(1057, 'Stephen', 'Rivera', 'stephen.rivera@company.com', '2021-09-01', 'Support Representative', 49931.00, 80, 1008),
(1058, 'Helen', 'Williams', 'helen.williams@company.com', '2020-10-18', 'Sales Manager', 73166.00, 30, 1003),
(1059, 'Jennifer', 'Martin', 'jennifer.martin@company.com', '2020-01-12', 'Sales Manager', 89699.00, 30, 1003),
(1060, 'Christine', 'Miller', 'christine.miller@company.com', '2020-09-28', 'SEO Analyst', 85675.00, 40, 1004),
(1061, 'Donald', 'Hernandez', 'donald.hernandez@company.com', '2017-07-01', 'Sales Manager', 93271.00, 30, 1003),
(1062, 'Timothy', 'Nelson', 'timothy.nelson@company.com', '2018-05-06', 'System Administrator', 70070.00, 60, 1006),
(1063, 'Jacob', 'Anderson', 'jacob.anderson@company.com', '2018-08-12', 'Recruiter', 59915.00, 10, 1001),
(1064, 'Patricia', 'Nelson', 'patricia.nelson@company.com', '2018-07-11', 'Content Strategist', 49549.00, 40, 1004),
(1065, 'Brian', 'Adams', 'brian.adams@company.com', '2023-07-22', 'Finance Manager', 46808.00, 50, 1005),
(1066, 'Kimberly', 'Lopez', 'kimberly.lopez@company.com', '2024-05-02', 'Software Engineer', 84096.00, 20, 1002),
(1067, 'Brian', 'Campbell', 'brian.campbell@company.com', '2020-07-20', 'Operations Analyst', 52578.00, 70, 1007),
(1068, 'Brenda', 'Gonzalez', 'brenda.gonzalez@company.com', '2019-01-23', 'Logistics Coordinator', 45110.00, 70, 1007),
(1069, 'Jonathan', 'Baker', 'jonathan.baker@company.com', '2018-06-14', 'Legal Counsel', 88531.00, 90, 1009),
(1070, 'Emma', 'Lee', 'emma.lee@company.com', '2016-12-10', 'IT Support Specialist', 88705.00, 60, 1006),
(1071, 'Dorothy', 'Sanchez', 'dorothy.sanchez@company.com', '2019-09-05', 'Operations Manager', 72554.00, 70, 1007),
(1072, 'Alexander', 'Mitchell', 'alexander.mitchell@company.com', '2017-10-19', 'Logistics Coordinator', 71612.00, 70, 1007),
(1073, 'James', 'Martin', 'james.martin@company.com', '2019-04-14', 'Compliance Officer', 84758.00, 90, 1009),
(1074, 'Cynthia', 'Lewis', 'cynthia.lewis@company.com', '2022-11-07', 'Database Administrator', 93231.00, 60, 1006),
(1075, 'Gregory', 'Garcia', 'gregory.garcia@company.com', '2019-09-22', 'Account Executive', 51120.00, 30, 1003),
(1076, 'Alexander', 'Martin', 'alexander.martin@company.com', '2018-04-05', 'Marketing Specialist', 48028.00, 40, 1004),
(1077, 'Jacob', 'Flores', 'jacob.flores@company.com', '2016-08-14', 'Marketing Manager', 92077.00, 40, 1004),
(1078, 'Amy', 'Sanchez', 'amy.sanchez@company.com', '2018-03-21', 'Operations Analyst', 45363.00, 70, 1007),
(1079, 'Maria', 'Ramirez', 'maria.ramirez@company.com', '2018-03-26', 'Engineering Manager', 75444.00, 20, 1002),
(1080, 'Anna', 'Thomas', 'anna.thomas@company.com', '2016-08-05', 'HR Coordinator', 88750.00, 10, 1001),
(1081, 'Anna', 'Hill', 'anna.hill@company.com', '2020-08-20', 'Compliance Officer', 78081.00, 90, 1009),
(1082, 'Stephen', 'Lewis', 'stephen.lewis@company.com', '2017-12-28', 'Logistics Coordinator', 74495.00, 70, 1007),
(1083, 'Dennis', 'Thomas', 'dennis.thomas@company.com', '2019-09-16', 'Accountant', 62996.00, 50, 1005),
(1084, 'Elizabeth', 'Rivera', 'elizabeth.rivera@company.com', '2019-04-09', 'Support Team Lead', 65952.00, 80, 1008),
(1085, 'David', 'Rodriguez', 'david.rodriguez@company.com', '2017-04-13', 'Compliance Officer', 55014.00, 90, 1009),
(1086, 'William', 'Clark', 'william.clark@company.com', '2021-06-18', 'SEO Analyst', 72248.00, 40, 1004),
(1087, 'Anthony', 'Clark', 'anthony.clark@company.com', '2021-10-23', 'HR Manager', 82728.00, 10, 1001),
(1088, 'Kathleen', 'Smith', 'kathleen.smith@company.com', '2020-05-25', 'Logistics Coordinator', 72460.00, 70, 1007),
(1089, 'Janet', 'Mitchell', 'janet.mitchell@company.com', '2023-10-08', 'Paralegal', 59380.00, 90, 1009),
(1090, 'Sharon', 'Young', 'sharon.young@company.com', '2015-07-11', 'Auditor', 92459.00, 50, 1005),
(1091, 'Cynthia', 'Rodriguez', 'cynthia.rodriguez@company.com', '2024-09-01', 'Sales Analyst', 83790.00, 30, 1003),
(1092, 'Gregory', 'Johnson', 'gregory.johnson@company.com', '2016-11-14', 'Research Scientist', 75257.00, 100, 1010),
(1093, 'Michael', 'Taylor', 'michael.taylor@company.com', '2021-06-07', 'Sales Analyst', 66420.00, 30, 1003),
(1094, 'Ruth', 'Harris', 'ruth.harris@company.com', '2019-07-09', 'System Administrator', 75822.00, 60, 1006),
(1095, 'Janet', 'Wright', 'janet.wright@company.com', '2015-06-08', 'HR Manager', 87713.00, 10, 1001),
(1096, 'Dennis', 'Johnson', 'dennis.johnson@company.com', '2018-04-27', 'HR Manager', 85719.00, 10, 1001),
(1097, 'Donald', 'Rodriguez', 'donald.rodriguez@company.com', '2022-11-04', 'Sales Manager', 75476.00, 30, 1003),
(1098, 'Jerry', 'White', 'jerry.white@company.com', '2017-10-20', 'Financial Analyst', 55732.00, 50, 1005),
(1099, 'Susan', 'Nguyen', 'susan.nguyen@company.com', '2015-05-19', 'Auditor', 70995.00, 50, 1005),
(1100, 'Elizabeth', 'Nguyen', 'elizabeth.nguyen@company.com', '2018-02-23', 'Content Strategist', 89843.00, 40, 1004),
(1101, 'Jessica', 'Torres', 'jessica.torres1101@company.com', '2015-06-18', 'R&D Engineer', 88353.00, 100, 1010),
(1102, 'William', 'Allen', 'william.allen@company.com', '2020-01-28', 'Database Administrator', 77125.00, 60, 1006),
(1103, 'Sharon', 'White', 'sharon.white@company.com', '2022-12-05', 'DevOps Engineer', 56543.00, 20, 1002),
(1104, 'Katherine', 'Moore', 'katherine.moore@company.com', '2024-09-25', 'Paralegal', 75465.00, 90, 1009),
(1105, 'Carolyn', 'Nguyen', 'carolyn.nguyen@company.com', '2019-06-28', 'Operations Manager', 50679.00, 70, 1007);


-- ============================================
-- DML: Project Data (15 records)
-- ============================================
INSERT INTO project (project_id, project_name, department_id, start_date, end_date, budget) VALUES
(1, 'Customer Portal Revamp', 20, '2023-01-15', '2023-08-30', 250000.00),
(2, 'Payroll Automation', 10, '2022-06-01', '2023-01-31', 120000.00),
(3, 'Q4 Sales Campaign', 30, '2023-09-01', '2023-12-31', 80000.00),
(4, 'Brand Refresh', 40, '2023-02-01', '2023-05-15', 60000.00),
(5, 'Annual Audit Prep', 50, '2023-11-01', '2024-01-15', 45000.00),
(6, 'Cloud Migration', 60, '2022-03-01', '2023-03-01', 500000.00),
(7, 'Warehouse Optimization', 70, '2023-04-01', '2023-10-01', 150000.00),
(8, 'Support Ticket System Upgrade', 80, '2023-01-10', '2023-06-30', 90000.00),
(9, 'Contract Review Automation', 90, '2023-05-01', '2023-09-30', 70000.00),
(10, 'New Product Prototype', 100, '2022-10-01', '2023-07-01', 300000.00),
(11, 'Mobile App Launch', 20, '2023-03-01', '2024-02-28', 400000.00),
(12, 'Recruitment Drive 2023', 10, '2023-01-01', '2023-12-31', 50000.00),
(13, 'International Expansion - Sales', 30, '2023-06-01', '2024-06-01', 200000.00),
(14, 'Data Center Consolidation', 60, '2023-07-01', '2024-01-31', 350000.00),
(15, 'Employee Wellness Program', 10, '2023-02-15', '2023-12-15', 35000.00);
