1. Display employees where first name contains letter a in either case.
    
   select * from employees where first_name like '%a%' or  first_name like '%A%';


2. Display employees where first name or last name ends with l.
    
   select first_name || ' ' || last_name from employees where first_name like '%l' or last_name like '%l';
   
3. Display employees who are managed by 103,105 or 120.

   select *  from employees where manager_id in (103,105,120);

4. Display employees who joined in the month of January 2008.

   select  *  from employees where to_char(hire_date,'mmyyyy') = '012008' ;
       
5. Display total salary for employees with commission.
     
   select salary+salary*commission_pct total_salary from employees where commission_pct is not null;
        
6. Display distinct department numbers from employees.

   select distinct department_id from employees order by 1;
      
7. Display cities in which we have our department.

   select city from locations where location_id in (select location_id from departments);
      
8. Display job id, employee id for jobs where employee worked for more than 200 days.

   select job_id,employee_id from employees where  sysdate-hire_date >200;
        
9. Display number of days between today and 1 Jan 2016.

   select trunc(sysdate-to_date('01-jan-2016')) from dual
        
10. Display employee name and salary rounded to thousands in the descending order of   rounded salary.

    select first_name,round(salary) from employees order by 2 desc
   
11. Display details of employees whose experience is more than 10 years.
 
    select * from employees where months_between(sysdate,hire_date)/12>10
       
12. If today happens to be friday, how do we get today's day

    select next_day(sysdate-1,'Fri') from dual
       
13. Display employee name, on which employee took first salary assuming salary is paid on first of every month.

    select first_name, last_day(hire_date) + 1 from employees

14. Display employee name, hire date and date on which training ends(assuming training is for 3 months).

    select first_name,hire_date,add_months(hire_date,3) from employees
        
15. Display employees who are are about to complete 10 years of experience by the end of the year.

    select  *  from employees where trunc(months_between('31-dec-2016',hire_date))>120
16. Display first word in job title.
     
    select job_title,substr(job_title,1,instr(job_title,' ')-1) from jobs
       
17. Display employees where first name contains letter 'e' in second last character and total length of first name and last name should be more than 10.

    select first_name from employees 
    where instr(first_name,'e',-2) = length(first_name)-1 and length(first_name)+length(last_name)>10;

18. Display employees who joined in the month of May.

    select * from employees where to_char(hire_date,'mon') = 'may'

19. Display how many employees with commission and without commission.

    select count(commission_pct) with_commission, count(*) - count(commission_pct) without_commission 
    from employees
            
20. Display average number of days employees did job as IT Programmer.

    select avg(end_date-start_date) from job_history 
    where job_id in (select job_id from jobs where job_title = 'Programmer')
      
21. Display highest salary of employees without commission pct.

    select max(salary) from employees where commission_pct is null
     
22. Display average salary of employees managed by employee 106 and first name contains letter a in either case.

    select avg(salary) from employees where manager_id = 106 and first_name like '%a%' or  first_name like '%A%'
    
23. Display year, department id number of employees who joined in that year.

    select to_char(hire_date,'yyyy'),department_id,count(*) from employees group by to_char(hire_date,'yyyy'),department_id   
   
24. Display location id and number of departments in the location.
    
    select location_id,count(*) from departments 
    group by location_id

25. Display how many employees joined in each month in year 2005.

    select to_char(hire_date,'mon'),count(*) from employees 
    where to_char(hire_date,'yyyy') = 2005 group by to_char(hire_date,'mon')

26. Display department id, average salary from highest average salary to lowest.

    select department_id,avg(salary) from employees group by department_id order by 2 desc

27. Display department name and average salary.

    select department_name,avg(salary) 
    from employees join departments using(department_id) 
    group by department_name
    
28. Display employee name and number of jobs employees did in the past.
        
    select first_name,count(*) 
    from employees  join job_history using(employee_id) 
    group by first_name 
 
29. Display job title and number of employees who did this job.

    select job_title,count(*) from employees natural join jobs group by job_title

30. Display how many employees have experienced more than five years.

    select count(*) from employees where months_between(sysdate,hire_date)>60

31. Display job title and number of employees who draw salary more than 5000.
          
    select job_title,count(*) from employees natural join jobs 
    where salary>5000 group by job_title

32. Display department name in which ther are more than 10 employees.
       
    select department_name from employees join departments using(department_id)
    group by department_name having count(*)>10

33. Display county name, city and department name.

    select country_name,city,department_name
    from departments join locations using (location_id) join countries using(country_id)

34. Display department name and number of employees joined in year 2007.

    select department_name,count(*) from employees join departments using(department_id)
    where to_char(hire_date,'yyyy') = '2007' group by department_name
       
35. Display department name, year and how many employees joined in the same year.

    select department_name,to_char(hire_date,'yyyy'),count(*) from employees 
    join departments using (department_id) group by department_name,to_char(hire_date,'yyyy')

36. Display city in which we have more than 10 employees working.

    select city,count(*) from employees join departments using(department_id) join 
    locations using (location_id) group by city having count(*)>10

37. Display employee name, department name, job title and city.

    select first_name,department_name,job_title,city
    from employees join departments using (department_id) join locations using (location_id) join jobs using(job_id)

38. Display employees who worked in department 30.

    select * from employees where employee_id in
              (select employee_id from job_history where department_id = 30)

39. Display job title where more than five employees have salary that is more than (( max salary + min salary )/2).
      
    select job_title from employees join jobs using(job_id)
    where salary > 
            (select (max(salary)+min(salary))/2 from employees)
    group by job_title having count(*)>5

40. Display name of the employee and his HOD for employees who joined in 2008 and have no commission percent.

    select e.first_name employee,m.first_name manager 
    from employees e join departments d using(department_id) join employees m on(m.employee_id=d.manager_id)
    where  to_char(e.hire_date,'yyyy') = '2008' and e.commission_pct is null;

41. Display details of employees who are in department with name 'IT'.

    select * from employees join departments using(department_id)  where department_name = 'IT'

42. Display job title and number of employees' average salary ffor employees who have more than 5 years of experience.

    select job_title,count(*),avg(salary) 
    from employees join jobs using(job_id) where months_between(sysdate,hire_date)>60 
    group by job_title     
  
43. Display employee name, his manager and his HOD .
    
    select e1.first_name employee,e2.first_name manager,e3.first_name hod 
    from employees e1 join employees e2 on (e1.manager_id = e2.employee_id) 
    join departments d on (e1.department_id = d.department_id)  
    join employees e3 on (e3.employee_id = d.manager_id);
       
44. Display employee name, city for employees where the manager of the department has more than 10 years of experience.

    select e.first_name,city from employees e join departments d on(e.department_id = d.department_id)
    join locations using(location_id) join employees m on(m.employee_id = d.manager_id) 
    where months_between(sysdate,m.hire_date)>120;

45. Display employee name, manager name, city and the experience of manager.
   
    select e.first_name employee,m.first_name manager,city,trunc(months_between(sysdate,m.hire_date)/12) manager_experience 
    from employees e join departments d on(e.department_id = d.department_id) join locations using(location_id)  
    join employees m on(m.employee_id = d.manager_id);
        
46. Display employee name and number of jobs done. Employees with no job history get 0 as count.
   
    select first_name, count(start_date) no_jobs
    from employees left outer join job_history using(employee_id) 
    group by first_name;
     
47. Display departments that don't have any employees.
     
    select * from departments where department_id not in
         (select department_id from employees where department_id is not null)

                                                              or
    select * from departments d
    where not exists (select 1 from employees where department_id = d.department_id)
   
48. Display employees who worked in department 10 or 20 or currently working in department IT.

    select * from employees join departments using(department_id)
    where department_id in
              (select department_id from job_history where department_id in (10,20)) or department_name = 'IT';

49. Display employees who did more than 1 job in the past.
    
    select  * from employees where employee_id in
              ( select employee_id from job_history group by employee_id having count(*)>1)
     
50. Display departments where we have more than 5 employees drawing more than 5000.

    select department_name  from departments where department_id in
       (select department_id from employees where salary>5000 group  by department_id having count(*)>5)

51. Display departments where number of employees is more than 5 and average salary is less than 5000.
 
    select * from departments 
    where department_id in
            ( select department_id from employees group by department_id having avg(salary)<5000 and count(*)>5)       
  
52. Display employees who never worked in department 30 and currently working in department 30.

    select * from employees where department_id = 30 and department_id not in 
                    (select department_id from job_history where department_id = 30)
         
53. Display departments in which we have more than two employees with history.
          
    select *  from departments where department_id in
              (select department_id from employees  where employee_id in 
                                                    (select employee_id from job_history) 
               group by department_id having count(*)>2);

54. Display country name in which more than 10 employees are working.

    select country_name from countries
    join locations using(country_id) join departments using(location_id)  join employees using(department_id)
    group by country_name having count(*)>10

55. Display department name and number of employees with experience more than 5 years and with no job history.

    select department_name,count(*) from departments join employees using(department_id)     
    where months_between(sysdate,hire_date)>60 and employee_id not in
                    (select employee_id from job_history)group by department_name

56. Display employees who are working in the department of Adams' and doing the same job as Adams'.

    select * from employees where (job_id,department_id) in                                                               
        (select job_id,department_id from employees where first_name = 'Adam') and first_name <> 'Adam';

57. Display employees whose experience is more than average experience in department.
     
    select * first_name from employees main where months_between(sysdate,hire_date) >                                                                                             
             (select avg(months_between(sysdate,hire_date)) from employees where department_id = main.department_id)    

58. Display departments in which employees joined in 2000 and not in 2001.

    select * from departments where department_id in 
                 (select department_id from employees where to_char(hire_date,'yyyy') = '2000' and to_char(hire_date,'yyyy')<>'2001') ;
       
59. Insert a row into jobs with id = 'IT_DBA', job title = 'DATABASE ADMIN', minimum salary is maximum salary of IT Programmer and maximum salary is maximum salary of 'AD_VP'. 

    insert into jobs values ('IT_DBA','DATABASE ADMIN' ,(select max(salary) from employees where job_id = 'IT_PROG'),
              (select max(salary) from employees where job_id = 'AD_VP'));


