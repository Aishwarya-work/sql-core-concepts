SELECT * FROM company_db.employee;
-- COMPARISON OPERATORS -- =,<>,>,<,<=,>=
SELECT * FROM company_db.employee 
WHERE salary >=40000;
-- Filtering rows based on dates:
SELECT * FROM company_db.employee 
WHERE extract(year from hire_date) =2026;
-- LOGICAL OPERATORS -- AND , OR , NOT
SELECT * FROM company_db.employee
WHERE manager_id = 202 AND extract(month from hire_date) =03;
SELECT * FROM company_db.employee
WHERE manager_id = 202 OR extract(month from hire_date) =03;
SELECT * FROM company_db.employee
WHERE NOT department_id = 2;
-- IN check multiple values ,shrtcut for OR
SELECT * FROM company_db.employee
WHERE department_id IN (1,4);
-- BETWEEN 
SELECT * FROM company_db.employee
WHERE SALARY between 50000 AND 100000;
-- NULL OPERATOR -- NULL value or no values or missing data
SELECT * FROM company_db.employee
WHERE manager_id IS NULL;
-- LIKE OPERATOR
SELECT * FROM company_db.employee
WHERE employee_name LIKE 'A%';
SELECT * FROM company_db.employee
WHERE employee_name LIKE 'A_shwarya';
SELECT * FROM company_db.employee
WHERE employee_name LIKE '%war%';
