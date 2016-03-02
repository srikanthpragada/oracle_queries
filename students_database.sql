create table courses
( code  varchar2(5)  constraint courses_pk  primary key,
  name  varchar2(30) constraint courses_name_nn not null
)  


create table students
( admno     number(5)    constraint students_pk primary key,
  name      varchar2(30) constraint students_name_nn not null,
  joinedon  date         default sysdate,
  course    varchar2(5)  constraint students_course_fk 
                          references courses(code) on delete cascade,
  totalfee  number(5)    constraint students_totalfee_chk  check(totalfee >= 0),
  feepaid   number(5)    default 0
                         constraint students_feepaid_chk  check(feepaid >= 0),
  constraint students_fee_check  check (feepaid <= totalfee)                         
)  


create table topics
(
  course    varchar2(5)  constraint topics_course_fk 
                         references courses(code) on delete cascade,
  topic     varchar2(30) constraint topics_topic_nn not null,                          
  hours     number(3)    constraint topics_hours_chk  check(hours > 0),
  constraint topics_pk   primary key(course,topic)
)  


insert into courses values('ora','Oracle Database');
insert into courses values('jse','Java SE 8.0');
insert into courses values('jee','Java EE 7.0');


insert into topics values('ora','Realtional Model',2);
insert into topics values('ora','Querying',8);
insert into topics values('jee','JDBC',6);
insert into topics values('jee','Servlets',8);

insert into students(admno,name,course,totalfee) values(1,'Steve Jobs','ora',5000);
insert into students(admno,name,course,totalfee) values(2,'Larry Ellison','jee',7000);

commit;
