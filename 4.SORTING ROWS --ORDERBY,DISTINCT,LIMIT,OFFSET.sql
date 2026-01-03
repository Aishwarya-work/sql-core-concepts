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