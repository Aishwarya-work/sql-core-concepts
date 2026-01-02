/* SELECT STATEMENT */
select employee_name from company_db.employee;
-- SELECT * (All Columns)
SELECT * FROM company_db.employee;
-- Avoid using SELECT * in real projects — it affects performance.
-- Selecting Multiple Columns
SELECT emp_id, employee_name, salary
FROM company_db.employee;
-- Column Alias (AS) --Used to give a temporary name to a column.
SELECT emp_id as id, employee_name as name, salary
FROM company_db.employee;
-- Expressions in SELECT --You can perform calculations inside SELECT.
SELECT emp_id as id, employee_name as name, salary*1.1 as increased_Salary
FROM company_db.employee;
-- SELECT with DISTINCT  -- remove duplicates
SELECT DISTINCT department_id
FROM company_db.employee;
-- select with where
SELECT emp_id as id, employee_name as name, salary,salary*1.2 as increased_Salary
FROM company_db.employee 
WHERE salary >=50000;

-- ----------------------------------------------------------------------------------

