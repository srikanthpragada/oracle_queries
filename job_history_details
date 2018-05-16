select first_name, job_title, department_name, start_date, end_Date
from employees e join job_history jh using(employee_id)
join jobs j on (j.job_id  = jh.job_id) join departments d
on (d.department_id = jh.department_id)
where  to_char(start_date,'yyyy')  > 2002
