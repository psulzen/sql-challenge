--1. List the following details of each employee: employee number, last name, first name, gender, and salary
select ee.emp_no, ee.last_name, ee.first_name, ee.gender, ss.salary 
from employees ee
left join salaries ss
on ee.emp_no = ss.emp_no
limit 10

-- 2. List employees who were hired in 1986.
select ee.emp_no, ee.hire_date
from employees ee
where hire_Date like '1986-%'
limit 10

--3. List the manager of each department with the following information:
--department number, 
--department name, 
--the manager's employee number, 
--last name, first name, 
--and start and end employment dates.
select 	 dm.dept_no
		,de.dept_name
		,dm.emp_no
		,ee.last_name
		,ee.first_name
		,dep.from_date
		,dep.to_date
from dept_manager dm 

inner join employees ee
on ee.emp_no = dm.emp_no

inner join dept_emp dep
on ee.emp_no = dep.emp_no
and dm.dept_no = dep.dept_no

left join departments de
on de.dept_no = dm.dept_no

limit 10

-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
select 	 de.dept_no 
		,ee.emp_no
		,ee.last_name
		,ee.first_name
		,dep.dept_name
from employees ee
inner join dept_emp de 
on de.emp_no = ee.emp_no

inner join departments dep 
on de.dept_no = dep.dept_no

limit 10

--5. List all employees whose first name is "Hercules" 
-- and last names begin with "B."
select ee.emp_no, first_name, last_name  from 
employees ee 
where first_name = 'Hercules'
and last_name like 'B%'

--6 List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
select 	 ee.emp_no
		,ee.last_name
		,ee.first_name
		,dep.dept_name
from employees ee
inner join dept_emp de
on de.emp_no = ee.emp_no

inner join departments dep 
on de.dept_no = dep.dept_no
where dep.dept_name = 'Sales'

limit 10

-- 7 List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, 
-- and department name.

select 	 ee.emp_no
		,ee.last_name
		,ee.first_name
		,dep.dept_name
from employees ee
inner join dept_emp de
on de.emp_no = ee.emp_no

inner join departments dep 
on de.dept_no = dep.dept_no
where dep.dept_name in ('Sales','Development')

limit 10

--8 In descending order, list the frequency count of employee last names
-- , i.e., how many employees share each last name.

select count(*) as count, ee.last_name
from employees ee
group by last_name 
order by count(*) desc








