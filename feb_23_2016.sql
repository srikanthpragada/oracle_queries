Q. Employees where email contains _
select * from employees
where  email like '%\_%' escape '\'

Q.  Jobs where title has at least two words
select * from  jobs
where  job_title like '% % %'

Q. Display first word of job title
select job_title, substr(job_title,1,instr(job_title || ' ',' ')) first_word
from  jobs


Q. Display date on which first salary was paid after 3 months of training
select first_name, hire_date, last_day(add_months(hire_date,3))+1 first_salary_date
from employees


