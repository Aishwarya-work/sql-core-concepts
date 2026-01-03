/* Aggregate functions work on multiple rows and return a single value. */
-- MIN AND MAX
SELECT MIN(SALARY) AS LEAST_SALARY FROM company_db.employee;
SELECT MAX(SALARY) AS HIGHEST_SALARY FROM company_db.employee;
-- AVG
SELECT AVG(SALARY) AS AVERAGE FROM company_db.employee;
-- SUM
SELECT SUM(SALARY) AS TOTAL_SALARY FROM company_db.employee;
-- COUNT
-- Find the number of employees whose salary is higher than 50,000
SELECT COUNT(*) FROM company_db.employee
WHERE SALARY >50000;
-- Find how many different departments are there in the employees table
SELECT COUNT(DISTINCT department_id) AS DEPARTMENTS FROM company_db.employee;
-- Return the number of employees for each department
SELECT department_id,COUNT(*) AS EMPLOYEE_COUNT FROM company_db.employee
GROUP BY 1;
-- Find number of employees who have a manager  /* COUNT(MANAGERID) IGNORES NULL MANAGER ID
SELECT COUNT(MANAGER_ID) FROM company_db.employee;
-- Find number of employees who not have  manager
SELECT COUNT(*) FROM company_db.employee 
WHERE manager_id IS NULL;