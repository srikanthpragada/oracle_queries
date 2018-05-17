-- Display Manager name and how many employees manager is managing 
select m.first_name, count(e.employee_id)
from employees e join employees m
on ( e.manager_id = m.employee_id)
group by  m.first_name
order by 1

-- Employees who worked in Shipping and currently working in Sales
select * from employees
where department_id in 
 (select department_id from departments where department_name = 'Sales')
union  
select * from employees
where employee_id in 
  (select employee_id 
   from job_history join departments using(department_id)
   where department_name = 'Shipping')
