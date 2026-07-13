USE midhtech_db;
SELECT * FROM department;
INSERT INTO department VALUES
(103, "HR"),
(104, "Finance"),
(105, "IT"),
(106, "Support"),
(107, "Testing"),
(108, "Admin"),
(109, "Operations"),
(110, "Security");
DESC department;

CREATE TABLE employee(
	emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) DEFAULT 30000,
    age INT CHECK(age>=18),
    dept_id INT,
    FOREIGN KEY(dept_id) REFERENCES department(dept_id)
    );
DESC employee;

INSERT INTO employee VALUES
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
SELECT * FROM employee;

-- PRIMARY KEY Example
INSERT INTO employee VALUES
(1, "Alex", "alex@gmail.com", 50000, 25, 101);

-- UNIQUE Example
INSERT INTO employee VALUES
(11, "Alex", "jogn@gmail.com", 50000, 25, 101);

-- NOT NULL Example
INSERT INTO employee (emp_id, email, salary, age, dept_id) VALUES
(11, "alex@gmail.com", 50000, 25, 101);

-- DEFAULT Example
INSERT INTO employee (emp_id, emp_name, email, age, dept_id) VALUES
(12, "Alex", "alex@gmail.com", 25, 101);

SELECT * FROM employee 
WHERE emp_id=11;

-- CHECK Example
INSERT INTO employee VALUES
(13, "Tom", "tom@gmail.com", 45000, 15, 101);
SELECT * FROM employee;

-- FOREIGN KEY Example
INSERT INTO employee VALUES
(14, "Sam", "sam@gmail.com", 45000, 25, 999);

-- SELECT 
SELECT * FROM employee;
SELECT emp_name FROM employee;
SELECT emp_name, salary FROM employee;
SELECT emp_name, age FROM employee;
SELECT emp_id, emp_name, dept_id FROM employee;

-- WHERE
SELECT * FROM employee
WHERE salary>50000;

SELECT * FROM employee
WHERE age>30;

SELECT * FROM employee
WHERE dept_id=103;

SELECT * FROM employee
WHERE emp_name="John";

-- DISTINCT
SELECT DISTINCT dept_id FROM employee;

-- ORDER BY
SELECT * FROM employee
ORDER BY salary;

SELECT * FROM employee
ORDER BY emp_name;

-- LIMIT
SELECT * FROM employee
LIMIT 5;

-- BETWEEN
SELECT * FROM employee
WHERE salary BETWEEN 50000 AND 65000;

-- IN
SELECT * FROM employee
WHERE dept_id IN (101, 103, 105);

-- NOT IN 
SELECT * FROM employee
WHERE dept_id NOT IN (101, 103, 105);

-- IS NULL
SELECT * FROM employee
WHERE email IS NULL;

-- IS NOT NULL
SELECT * FROM employee
WHERE email IS NOT NULL;

-- LIKE %
SELECT * FROM employee
WHERE emp_name LIKE "J%";

SELECT * FROM employee
WHERE emp_name LIKE "%a";

SELECT * FROM employee
WHERE emp_name LIKE "%an%";

SELECT * FROM employee
WHERE emp_name LIKE "_o%";

-- Aggregate Functions
-- MAX()
SELECT MAX(salary) FROM employee;
-- MIN()
SELECT MIN(salary) FROM employee;
-- SUM()
SELECT SUM(salary) FROM employee;
-- AVG()
SELECT AVG(salary) FROM employee;
-- COUNT()
SELECT COUNT(*) FROM employee;

-- GROUP BY
SELECT dept_id, COUNT(*)
FROM employee
GROUP BY (dept_id);

-- HAVING
SELECT dept_id, COUNT(*)
FROM employee
GROUP BY (dept_id)
HAVING COUNT(*)>1;

-- ALIAS
SELECT emp_name AS Employee_Name, 
salary AS Employee_Salary
FROM employee;

SELECT e.emp_name, 
e.salary
FROM employee e;

SELECT dept_id, AVG(salary) AS Average_Salary
FROM employee
GROUP BY dept_id; 

SELECT dept_id, SUM(salary) AS Total_Salary
FROM employee
GROUP BY dept_id;

SELECT dept_id, MIN(salary) AS Minimum_Salary
FROM employee
GROUP BY dept_id;

SELECT dept_id, MAX(salary) AS Maximum_Salary
FROM employee
GROUP BY dept_id;

SELECT dept_id, COUNT(*) AS Total_members
FROM employee
GROUP BY dept_id;

-- INNER JOIN
SELECT d.dept_name, e.emp_name
FROM department as d
INNER JOIN employee as e
ON d.dept_id=e.dept_id;

-- LEFT JOIN
SELECT d.dept_name, e.emp_name
FROM department as d
LEFT JOIN employee as e
ON d.dept_id=e.dept_id;

-- RIGHT JOIN
SELECT d.dept_name, e.emp_name
FROM employee as e
RIGHT JOIN department as d 
ON d.dept_id=e.dept_id;

-- OUTER JOIN
SELECT d.dept_name, e.emp_name
FROM department as d
LEFT JOIN employee as e
ON d.dept_id=e.dept_id
UNION
SELECT d.dept_name, e.emp_name
FROM department as d
RIGHT JOIN employee as e
ON d.dept_id=e.dept_id;







