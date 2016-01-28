-- Display 5th highest salary 

select *
from employees outer
where 4 = 
   ( select count(*)
     from employees
     where salary > outer.salary)
     
     
