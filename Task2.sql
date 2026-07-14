USE midhtech_db;

CREATE TABLE department10(
	department_id VARCHAR(20) PRIMARY KEY,
    department_name VARCHAR(20) NOT NULL
    ); 
    
INSERT INTO department10 VALUES
(101, "HR"),
(102, "IT");

-- UPDATE

UPDATE department10
SET department_name="HR" 
WHERE department_id=102;

SELECT * FROM department10;

UPDATE department10
SET department_name="Finance"
WHERE department_id=101;

CREATE TABLE employee10(
	emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) DEFAULT 30000,
    age INT CHECK(age>=18),
    dept_id INT
    );

INSERT INTO employee10 VALUES
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

-- Update

START TRANSACTION;

UPDATE employee10
SET salary=salary-1000
WHERE emp_name="John";

COMMIT;

UPDATE employee10
SET salary=salary+1000
WHERE emp_name="David";

COMMIT;


SELECT * FROM employee10;

-- ALTER
-- ADD
ALTER TABLE department10
ADD email VARCHAR(50);

-- MODIFY
ALTER TABLE department10
MODIFY email VARCHAR(100);

-- RENAME
ALTER TABLE department10 
RENAME COLUMN email to MobileNumber;

-- DELETE
DELETE FROM department10
WHERE department_name="HR";


SELECT * FROM department10;


















