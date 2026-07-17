-- Day 2 SQL schema for the Student Management System

CREATE TABLE IF NOT EXISTS Student (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    enrollment_date TEXT NOT NULL DEFAULT (DATE('now')),
    gpa REAL DEFAULT 0.0,
    is_active INTEGER NOT NULL DEFAULT 1
);

-- Sample inserts
INSERT INTO Student (first_name, last_name, email, gpa)
VALUES
    ('Aisha', 'Patel', 'aisha.patel@example.com', 3.8),
    ('Jason', 'Kim', 'jason.kim@example.com', 3.4),
    ('Mia', 'Lopez', 'mia.lopez@example.com', 3.9);

-- Query the table
SELECT * FROM Student;

-- Update a student record
UPDATE Student
SET gpa = 3.95
WHERE email = 'mia.lopez@example.com';

-- Delete a student record
DELETE FROM Student
WHERE email = 'jason.kim@example.com';

-- Use NULL checks
SELECT * FROM Student
WHERE is_active IS NOT NULL;
