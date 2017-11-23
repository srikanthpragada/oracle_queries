
create type  job_type as object
( job_id  varchar2(10),
  job_title varchar2(30)
)

create table ot_jobs of job_type

insert into ot_jobs values('prog','Programmer')
insert into ot_jobs values( job_type('dba','Database Admin'))

select reftohex(ref(j)) from ot_jobs j


create type  employee_type as object
( employee_id  number(5),
  employee_name  varchar2(30),
  job    ref  job_type
)


create table ot_employees of employee_type

insert into ot_employees values(1,'Scott', (select ref(j) from ot_jobs j where job_id = 'prog'))
insert into ot_employees values(2,'Tomoas', (select ref(j) from ot_jobs j where job_id = 'prog'))

select employee_name, deref(job).job_title from ot_employees
