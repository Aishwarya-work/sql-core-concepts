/* SELECT & WHERE */
-- 1. Show all employee names
SELECT employee_name FROM company_db.employee;
-- 2.Show employee name and salary
SELECT employee_name FROM company_db.employee;
-- 3.Show salary with 20% hike
SELECT employee_name, salary*1.2 AS increased_Salary FROM company_db.employee;
-- 4.Show unique department IDs
SELECT DISTINCT department_id FROM company_db.employee;
-- 5.Write a query to display all employee details.
SELECT * FROM company_db.employee;
-- 6. Get employee names whose salary is greater than 50,000.
SELECT employee_name FROM company_db.employee
WHERE salary >50000;
-- 7.Get employees whose name starts with ‘A’.
SELECT * FROM company_db.employee
WHERE employee_name LIKE 'A%';
-- 8.Fetch employees whose salary is between 30,000 and 70,000.
SELECT employee_name FROM company_db.employee
WHERE salary BETWEEN 30000 AND 70000 ;
-- 9.Find employees where manager_id is NULL.
SELECT * FROM company_db.employee
WHERE manager_id IS NULL;

/* ORDER BY & DISTINCT */
-- Show employees ordered by hire_date (latest first)
SELECT * FROM company_db.employee
ORDER BY hire_date DESC;
-- DISTINCT on a Single Column
-- Get unique department IDs
SELECT distinct department_id FROM company_db.employee;
-- DISTINCT on Multiple Columns
-- Unique combinations of department & manager
SELECT distinct department_id,manager_id FROM company_db.employee
order by department_id;
-- Get top 3 highest paid employees.
SELECT * FROM company_db.employee
ORDER BY SALARY DESC
LIMIT 3;
-- OFFSET
/* LIMIT controls how many rows are returned.
OFFSET controls how many rows are skipped. */
SELECT * FROM company_db.employee
ORDER BY SALARY 
LIMIT 3 OFFSET 1;
-- Get unique department names from employees table.
SELECT DISTINCT department_id FROM company_db.employee;

/* AGGREGATE FUNCTIONS */

-- Count total number of employees.
SELECT COUNT(*) FROM company_db.employee;
-- Find average salary of employees.
SELECT AVG(SALARY) FROM company_db.employee;
-- Find minimum and maximum salary.
SELECT MIN(SALARY) AS LEAST_SALARY FROM company_db.employee;
SELECT MAX(SALARY) AS HIGHEST_SALARY FROM company_db.employee;

/* GROUP BY & HAVING */
-- Find number of employees in each department.
SELECT department_id,count(*) as emp_cnt FROM company_db.employee
GROUP BY department_id;
-- Find departments having more than 5 employees.
SELECT department_id,count(*) as emp_cnt FROM company_db.employee
GROUP BY department_id
HAVING count(*) >5;

