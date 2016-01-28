-- display employees who are currently working in department 30 or 80 but never worked in 30 or 80

select * from employees
where department_id in (30,80)
and employee_id not in 
 (select employee_id from job_history where department_id in (30,80));
 
-- update salary of employee 120 to gratest salay of 115 and 116 
 
update employees
   set salary = (select max(salary) from employees where employee_id in (115,116) )
 where employee_id = 120 
 
-- insert a new department with the following details

insert into departments 
 values( 
    (select max(department_id) + 10 from departments),
    'Support',
    (select manager_id from departments where department_name = 'Sales'),
    1200)

--  display department with maximum number of employees

select * from departments
where department_id in
(
  select department_id
  from employees
  group by department_id
  having count(*) = 
     (select max( count(*))
      from employees
      group by department_id )
)
   
Method 2
--------

select department_name from 
(
   select department_name, count(*)
   from  departments d  join employees using(department_id)
   group by department_name
   order by count(*) desc 
)
where rownum = 1


--- Display department in which employee joined in 2005, but not in 2002

select * from departments 
where department_id in
  ( select department_id from employees where to_char(hire_date,'yyyy') = 2005)
and department_id not in 
  ( select department_id from employees where to_char(hire_date,'yyyy') = 2002)
  
--- Display department name, manager name, no. of employees

select d.department_name, first_name, empcount.noemp
from departments d,
     employees e,
     (select department_id, count(*) noemp
      from employees 
      group by department_id) empcount
where d.manager_id = e.employee_id and  d.department_id = empcount.department_id  




