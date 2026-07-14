-- TASK-1
-- PART-A
-- Create a user named student1 and assign password student1@123
CREATE USER 'student1'@'localhost'
IDENTIFIED BY 'student1@123';

CREATE DATABASE company_db;
USE company_db;

-- Grant only select permission on company_db;
GRANT SELECT 
ON company_db.*
TO 'student1'@'localhost';

-- Verify Permissions using Grant
SHOW GRANTS
FOR 'student1'@'localhost';

-- PART-B
CREATE TABLE employee14(
	emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) DEFAULT 30000,
    age INT CHECK(age>=18),
    dept_id INT
    );
INSERT INTO employee14 VALUES
(1, "John", "john@gmail.com", 45000, 25, 101),
(2, "David", "david@gmail.com", 50000, 28, 102),
(3, "Emma", "emma@gmail.com", 60000, 30, 103),
(4, "Sophia", "sophia@gmail.com", 55000, 26, 104),
(5, "James", "james@gmail.com", 70000,32, 105),
(6, "Michael", "michael@gmail.com", 48000, 27,103),
(7, "Olivia", "olivia@gmail.com", 52000, 24, 104),
(8, "Daniel", "daniel@gmail.com", 65000, 31, 102),
(9, "Charlotte", "charlotte@gmail.com", 58000, 29, 101),
(10, "Henry", "henry@gmail.com", 75000, 35, 105);

SELECT * FROM employee14;

-- Start a transaction
START TRANSACTION;

-- Update salary of employee ID 1 and verify
UPDATE employee14
SET salary=salary+10000
WHERE emp_name="John";

-- Rollback the transaction
ROLLBACK;
SELECT * FROM employee11;

COMMIT;

-- Start another transaction
START TRANSACTION;

UPDATE employee14
SET salary=salary+20000
WHERE emp_name="sophia";

Rollback;
SELECT * FROM employee14;
COMMIT;


-- PART-C
-- Add a phone column to employee table
ALTER TABLE employee14
ADD phone_number VARCHAR(20);

-- Update Phone numbers for any three employees

UPDATE employee14
SET phone_number = '9876543210'
WHERE emp_id = 1;

UPDATE employee14
SET phone_number = '9123456789'
WHERE emp_id = 2;

UPDATE employee14
SET phone_number = '9988776655'
WHERE emp_id = 3;

-- Display the table
SELECT * FROM employee14;


-- Truncate the employee table
TRUNCATE TABLE employee11;

-- Drop the department table
CREATE TABLE department11(
	department_id VARCHAR(20) PRIMARY KEY,
    department_name VARCHAR(20) NOT NULL
    ); 
    
INSERT INTO department11 VALUES
(101, "HR"),
(102, "IT");

SELECT * FROM department11;

DROP TABLE department11;

-- DROP the Database
CREATE DATABASE office_db1;
DROP DATABASE office_db1;
SHOW DATABASES;
USE office_db1;

-- TASK-2
CREATE TABLE employee12(
	emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) DEFAULT 30000,
    age INT CHECK(age>=18),
    dept_id INT
    );
 INSERT INTO employee12 VALUES
(1, "John", "john@gmail.com", 45000, 25, 101),
(2, "David", "david@gmail.com", 50000, 28, 102),
(3, "Emma", "emma@gmail.com", 60000, 30, 103),
(4, "Sophia", "sophia@gmail.com", 55000, 26, 104),
(5, "James", "james@gmail.com", 70000,32, 105),
(6, "Michael", "michael@gmail.com", 48000, 27,103),
(7, "Olivia", "olivia@gmail.com", 52000, 24, 104),
(8, "Daniel", "daniel@gmail.com", 65000, 31, 102),
(9, "Charlotte", "charlotte@gmail.com", 58000, 29, 101),
(10, "Henry", "henry@gmail.com", 75000, 35, 105);

SELECT * FROM employee12;

-- Create one subquery to display the employee with the highest salary.
SELECT *
FROM employee12
WHERE salary = (
    SELECT MAX(salary)
    FROM employee12
);

-- Create one stored procedure to display all employee records.
DELIMITER //

CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT *
    FROM employee12;
END //

DELIMITER ;

CALL GetAllEmployees();

-- Create one index on the emp_name column.
CREATE INDEX idx_emp_name
ON employee12(emp_name);

SELECT *
FROM employee12
WHERE emp_name = 'John';



