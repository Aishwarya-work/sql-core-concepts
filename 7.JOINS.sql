/* JOINS */
/* INNER JOIN = common data only */
-- 1.Show employee name and department name
-- When you want only employees who belong to a valid department.
SELECT e.employee_name,d.dept_name
FROM company_db.employee e
INNER JOIN company_db.departments d
ON e.department_id = d.dept_id; 

-- 2.Show employee name, department name only for IT department
SELECT e.employee_name,d.dept_name
FROM company_db.employee e
INNER JOIN company_db.departments d
ON e.department_id = d.dept_id
WHERE d.dept_name = 'IT'; 

-- 3. Find employees who are assigned to projects
SELECT e.employee_name,ep.project_id
FROM company_db.employee e
JOIN company_db.employee_projects ep
ON e.emp_id = ep.emp_id;

-- 4. Show employee name and department name for employees whose salary is greater than 50,000.
SELECT e.employee_name,d.dept_name,e.SALARY
FROM company_db.employee e
INNER JOIN company_db.departments d
ON e.department_id = d.dept_id
WHERE e.SALARY >50000;

/* LEFT JOIN */
-- 5.Show all employees and their department names (even if department is missing)
SELECT e.employee_name, d.dept_name
FROM company_db.employee e
LEFT JOIN company_db.departments d
ON e.department_id = d.dept_id;
SELECT * FROM company_db.employee;

-- 6. Find employees who do NOT belong to any department
SELECT e.employee_name, d.dept_name
FROM company_db.employee e
LEFT JOIN company_db.departments d
ON e.department_id = d.dept_id
WHERE d.dept_id IS NULL;

-- 7.Show all employees with salary > 50,000 and their department names
SELECT e.employee_name, d.dept_name,E.SALARY
FROM company_db.employee e
LEFT JOIN company_db.departments d
ON e.department_id = d.dept_id
WHERE e.SALARY >50000;

-- 8. Show all employees and their department names, including employees without a department.
SELECT e.employee_name, d.dept_name
FROM company_db.employee e
LEFT JOIN company_db.departments d
ON e.department_id = d.dept_id;

-- 9.Show employee name and manager name
SELECT e.employee_name AS employee,
       m.employee_name AS manager
FROM company_db.employee e
LEFT JOIN company_db.employee m
ON e.manager_id = m.emp_id;

-- 10.Write a query to show employee name and manager name(include employees without managers).
SELECT e.employee_name AS employee,
       m.employee_name AS manager
FROM company_db.employee e
LEFT JOIN company_db.employee m
ON e.manager_id = m.emp_id;
/* NOTE : In LEFT JOIN, adding a WHERE condition on the same table can filter out rows and change the result. */