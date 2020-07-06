drop table payments;
drop table students;
drop table courses;


create table courses
 (code varchar2(5) constraint courses_pk primary key, 
  name varchar2(30) constraint courses_name_nn not null);


insert into courses values('ora','Oracle Database');
insert into courses values('dsc','Data Science');
insert into courses values('jse','Java SE');
insert into courses values('jee','Java EE');
insert into courses values('pyt','Python');


create table students
 (admno number(5) constraint students_pk primary key, 
  name varchar2(30) constraint students_name_nn not null, 
  joinedon date default sysdate, 
  course varchar2(5) constraint students_course_fk references courses(code), 
  totalfee number(5) constraint students_totalfee_chk check( totalfee >= 0), 
  feepaid number(5) constraint students_feepaid_chk check( feepaid >= 0), 
  constraint students_fee_check check(feepaid <= totalfee)
);


insert into students values(1,'Goerge',sysdate-2,'ora',10000,5000);
insert into students values(2,'Mike Tyson',sysdate,'dsc',20000,15000);
insert into students values(3,'John Stammer',sysdate - 10,'dsc',15000,10000);
insert into students values(4,'Oreily',sysdate,'jee',20000,5000);
insert into students values(5,'Richard',sysdate - 20,'jse',25000,3000);
insert into students values(6,'Virat',sysdate,'pyt',15000,1000);
insert into students values(7,'Sree',sysdate - 30,'jse',20000,5000);
insert into students values(8,'Laura',sysdate,'pyt',15000,5000);
insert into students values(9,'Shefali',sysdate-20,'dsc',15000,2000);
insert into students values(10,'Avital',sysdate-5,'jee',20000,5000);


create table payments(
  invno number(20) constraint payments_invno_pk primary key,
  admno number(5) constraint  payments_admno_fk references students(admno),
  paydate date default sysdate,
  amount number(5) constraint payments_amount_chk check(amount > 0),
  paymode char(1) constraint payments_paymode_chk check(upper(paymode) in ('C','O','Q')),
  remarks varchar(40) 
);


insert into payments values(100,3,'20-jun-2020',5000,'c',null);
insert into payments values(101,1,'21-jun-2020',6000,'o',null);
insert into payments values(102,2,'22-jun-2020',10000 , 'o' ,'Google Pay');
insert into payments values(103,4,'23-jun-2020',5000,'o','PhonePE');
insert into payments values(104,5,'1-jul-2020', 4000,'c',null);
insert into payments values(105,2,'3-jul-2020', 6000,'o',null);

commit;



