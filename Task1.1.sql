-- Task 1: Employee Database Creation (Beginner)
-- Objective
-- Create a complete employee database.
-- Requirements
-- Create a database named office_db.
-- Create a Department table with:
-- Department ID (Primary Key)
-- Department Name (NOT NULL)
-- Create an Employee table with:
-- Employee ID (Primary Key)
-- Employee Name (NOT NULL)
-- Email (UNIQUE)
-- Salary (DEFAULT 25000)
-- Age (CHECK age >=18)
-- Department ID (Foreign Key)
-- Insert:
-- 5 departments
-- 10 employees

CREATE DATABASE office_db;
USE office_db;

CREATE TABLE department1(
	department_id VARCHAR(20) PRIMARY KEY,
    department_name VARCHAR(20) NOT NULL
    );

CREATE TABLE employee1(
	employee_id VARCHAR(20) PRIMARY KEY,
    employee_name VARCHAR(20) NOT NULL,
	email VARCHAR(20) UNIQUE,
    salary INT DEFAULT 25000,
    age INT CHECK(age>18),
    department_id VARCHAR(20),
    FOREIGN KEY(department_id) REFERENCES department1(department_id)
    );
    
INSERT INTO department1 VALUES
(101, "HR"),
(102, "IT");

INSERT INTO department1 VALUES
(103, "HR"),
(104, "IT");

INSERT INTO department1 VALUES
(105, "FINANCE");

INSERT INTO employee1 VALUES
(1, 'Ram', 'ram@gmail.com', 50000, 29, 101),
(2, 'Sita', 'sita@gmail.com', 50000, 28, 101),
(3, 'Lakshman', 'lakshman@gmail.com', 45000, 27, 101),
(4, 'Hanuma', 'hanuma@gmail.com', 45000, 26, 101),
(5, 'Sugreev', 'sugreev@gmail.com', 45000, 25, 102),
(6, 'Angadh', 'angadh@gmail.com', 35000, 26, 102),
(7, 'Sriram', 'sriram@gmail.com', 45000, 32, 102),
(8, 'MahaLakshmi', 'maha@gmail.com', 45000, 34, 101),
(9, 'Ramu', 'ramu@gmail.com', 35000, 24, 102),
(10, 'Rama', 'rama@gmail.com', 35000, 24, 101);

SELECT employee_name FROM employee1;

-- Task 2: SQL Queries Challenge (Intermediate)
-- Using the Employee and Department tables, write queries for the following:

-- Display all employees.
SELECT employee_name FROM employee1;

-- Display only employee names and salaries.
SELECT employee_name, salary
FROM employee1;

-- Find employees earning more than ₹50,000.
SELECT COUNT(employee_name)
FROM employee1
WHERE salary>50000;

-- Find employees between ages 25 and 30.
SELECT COUNT(employee_name)
FROM employee1
WHERE age>25 AND age<30;

-- Display employees from departments 101 and 103.
SELECT employee_name 
FROM employee1
WHERE department_id in (101, 103);

-- Display distinct department IDs.
SELECT DISTINCT(department_id)
FROM employee1;

-- Sort employees by salary in descending order.
SELECT employee_name 
FROM employee1
ORDER BY salary DESC;

-- Display the first 5 employees.
SELECT employee_name
FROM employee1
LIMIT 5;

-- Find employees whose names start with 'J'.
SELECT employee_name
FROM employee1
WHERE employee_name LIKE "J%";

-- Display:
SELECT * FROM employee1;

-- Total employees
SELECT COUNT(*) AS Total_employees
FROM employee1;

-- Maximum salary
SELECT MAX(salary)
FROM employee1;

-- Minimum salary
SELECT MIN(salary)
FROM employee1;

-- Average salary
SELECT AVG(salary)
FROM employee1;

-- Count employees department-wise using GROUP BY.
SELECT department_id, COUNT(employee_name) AS Total_employees
FROM employee1
GROUP BY department_id;

-- Display only departments having more than one employee using HAVING.
SELECT department_id, COUNT(employee_name) AS Total_employees
FROM employee1
GROUP BY department_id
HAVING COUNT(employee_name)>1;

-- Display employee name with department name using INNER JOIN.
SELECT e.employee_name, d.department_name
FROM department1 AS d
INNER JOIN employee1 AS e
ON d.department_id=e.department_id;


    