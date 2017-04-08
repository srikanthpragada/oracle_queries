-- display job title and no. of employee doing or did the job

select job_title, count(*)
from 
  ( select job_id,employee_id
    from employees
    union
    select job_id, employee_id
    from job_history )
natural join jobs
group by job_title


-- Display 5th highest salary 

select *
from employees outer
where 4 = 
   ( select count(*)
     from employees
     where salary > outer.salary)
     
-- display details of old jobs done by employees     
select first_name, job_title, floor(months_between(end_date, start_date)),
department_name, city
from employees e join job_history jh using(employee_id) 
join jobs j on (jh.job_id = j.job_id) 
join departments d on (jh.department_id = d.department_id)
join locations using (location_id)
order by 1

--  Display names of employees who draw more than their managers
select e.first_name
from employees e join employees m
on (e.manager_id = m.employee_id)
where  e.salary > m.salary
