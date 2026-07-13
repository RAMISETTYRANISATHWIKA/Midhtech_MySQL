CREATE database Midhtech_db;
SHOW databases;
USE Midhtech_db;
CREATE table department(
          dept_id int primary key,
          dept_name varchar(50)
);
desc department;
INSERT into department values
(101, 'Finance'),
(102, 'IT');
SELECT * FROM department;
