/* GROUP BY & HAVING */

-- GROUP BY groups rows and applies aggregate functions to each group.

/* GROUP BY – Single Column */
-- Department-wise employee count
SELECT department_id, COUNT(*) AS emp_count
FROM company_db.employee
GROUP BY department_id;
-- Average salary per department
SELECT department_id, AVG(SALARY) AS AVG_sAL
FROM company_db.employee
GROUP BY department_id;

-- GROUP BY – Multiple Columns
-- Department & manager-wise employee count
SELECT department_id, manager_id, COUNT(*) AS emp_count
FROM company_db.employee
GROUP BY department_id, manager_id
ORDER BY department_id;

-- Find total salary per department
SELECT department_id,SUM(SALARY) AS TOTAL_SALARY FROM company_db.employee 
GROUP BY department_id;

-- Find employee count per department and manager
SELECT department_id, manager_id, COUNT(*) AS emp_count
FROM company_db.employee
GROUP BY department_id, manager_id
ORDER BY department_id;

/* HAVING */
-- Departments having less than 2 employees and salary is > 60000
SELECT department_id,count(*) as emp_count FROM company_db.employee
WHERE SALARY >60000
GROUP BY department_id
HAVING emp_count<2
ORDER BY department_id
LIMIT 1;

-- Find departments having total salary greater than 1,50,000
SELECT department_ID,SUM(SALARY) AS TOTAL_sALARY from company_db.employee
GROUP BY department_ID
HAVING TOTAL_SALARY >150000
ORDER BY department_id;


