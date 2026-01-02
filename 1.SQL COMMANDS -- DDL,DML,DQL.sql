-- DDL COMMANDS -- WORK ON STRUCTURE
/* CREATE */
CREATE DATABASE company_db;
USE company_db;
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    department_id INT,
    manager_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(dept_id)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    department_id INT,
    start_date DATE
);
CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT
);
select * from employees;

/* ALTER*/
-- 1.ADD COLUMN:
ALTER TABLE employees
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
ADD COLUMN updated_by VARCHAR(50),
ADD COLUMN is_active BOOLEAN DEFAULT TRUE;
-- -2.DROP COLUMN
ALTER TABLE company_db.employees
DROP COLUMN created_At;
-- 3.MODIFY COLUMN -- CHANGE DATATYPE, CONSTRAINTS
ALTER TABLE company_db.employees
MODIFY COLUMN SALARY DECIMAL(10,2);
-- 4️.RENAMING A COLUMN
ALTER TABLE company_db.employees
RENAME COLUMN emp_name TO employee_name;
-- 5.ADDING A CONSTRAINT
ALTER TABLE company_db.employees
ADD COLUMN email VARCHAR(20);
ALTER TABLE employees
ADD CONSTRAINT uq_email UNIQUE (email);
-- 6.DROPING A CONSTRAINT
ALTER TABLE company_db.employees
DROP constraint  UQ_EMAIL;
-- 7.RENAMING THE TABLE
ALTER TABLE company_db.employees
RENAME TO employee_info;
/* -- 8.ADDING A PRIMARY KEY
ALEADY PK EXISTS IN company_db.employee_info.. JUST FOR KNOWLEDGE
ALTER TABLE company_db.employee_info
ADD CONSTRAINT pk_emp PRIMARY KEY(emp_id);
-- 9.DROPING PK
ALTER TABLE company_db.employee_info
DROP CONSTRAINT pk_emp */

/* 
-- ADDING A FOREIGN KEY
ALTER TABLE employee_details
ADD CONSTRAINT fk_dept
FOREIGN KEY (department_id)
REFERENCES departments(dept_id);
-- ALTER TABLE employee_details
DROP FOREIGN KEY fk_dept;
*/
/*
-- DROP
DROP DATABASE company_db;
DROP TABLE company_db.employee_info;
*/
/* TRUNCATE
TRUNCATE TABLE company_db.employee_info;
*/
-- RENAME TABLE
RENAME TABLE employee_info TO employee;
DROP DATABASE company_db;
-- ------------------------------------------------------------------------------------------------------
-- DML COMMANDS -- WORKS ON DATA

INSERT INTO employee
(emp_id, employee_name, salary, department_id, manager_id, hire_date, email, created_by, is_active)
VALUES
(202, 'Neha Singh', 55000, 2, 201, '2022-03-10', 'neha@gmail.com', 'HR_ADMIN', TRUE),
(203, 'Ravi Kumar', 48000, 1, 201, '2021-06-20', 'ravi@gmail.com', 'HR_ADMIN', TRUE),
(204, 'Priya Sharma', 72000, 3, NULL, '2019-08-01', 'priya@gmail.com', 'HR_ADMIN', TRUE);
INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales'),
(5, 'Marketing');
INSERT INTO projects VALUES
(201, 'ERP System', 2, '2021-01-10'),
(202, 'HR Automation', 1, '2022-02-15'),
(203, 'Finance Tracker', 3, '2020-06-01'),
(204, 'Sales Dashboard', 4, '2021-11-10');
INSERT INTO employee_projects VALUES
(201, 201),
(202, 201),
(203, 202),
(204, 203),
(205, 204);

/* UPDATE */
UPDATE company_db.employee_projects
SET project_id = 205
WHERE emp_id = 205;

/* DELETE */
DELETE FROM company_db.employee_projects
WHERE emp_id = 205;

select * from company_db.departments;
select * from company_db.employee;
select * from company_db.employee_projects;
select * from company_db.projects;

/* DQL */
-- SELECT 
SELECT * FROM company_db.departments;
SELECT emp_id, employee_name FROM company_db.employee;
SELECT DISTINCT emp_id from company_db.employee;

-- NOTE: NULL --This last row is just a placeholder for inserting new data.