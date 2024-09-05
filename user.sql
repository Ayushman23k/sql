drop table EMPLOYEE ;
CREATE TABLE EMPLOYEE ( 
ID NUMBER(4),
NAME VARCHAR(10),
DEPARTMENT VARCHAR(10),
SALARY number(9,2),
GENDER char(6),
AGE NUMBER(2), 
CITY VARCHAR(10)) ;


insert INTO EMPLOYEE values (1001, 'John', 'IT', 35000, 'Male', 25, 'London') ;
insert INTO EMPLOYEE values (1002, 'Smith', 'hr', 45000, 'FeMale', 27, 'Mumbai') ;

INSERT INTO EMPLOYEE (ID, NAME, GENDER, AGE) values (2001, 'Priyanka', 'Femail', 22) ;
INSERT INTO EMPLOYEE (ID, NAME, GENDER, CITY) values (2002, 'Rakesh', 'Male', 'lONDON') ;

SELECT * from EMPLOYEE ;

INSERT INTO EMPLOYEE VALUES (&ID, '&NAME', '&DEPARTMENT', &SALARY, '&GENDER', '&AGE', '&CITY');

--UPDATE COMMAND

UPDATE EMPLOYEE set SALARY=70000 WHERE DEPARTMENT='Finance';

UPDATE EMPLOYEE set CITY='Bbsr' WHERE SALARY>50000 AND GENDER='Femail' ;

UPDATE EMPLOYEE set CITY='Moscow', SALARY=150000 WHERE DEPARTMENT='IT'  ;

UPDATE EMPLOYEE set CITY=null WHERE AGE<27 ;

UPDATE EMPLOYEE set CITY='Gunupur' WHERE CITY is null ;

--Delete Command 

SELECT * FROM EMPLOYEE ;

DELETE from EMPLOYEE WHERE ID = 2001 ;

DELETE from EMPLOYEE WHERE ID = 2002 ;

RENAME EMPLOYEE to tcs_employee ;

CREATE TABLE lg_employee ( 
lID NUMBER(4),
lNAME VARCHAR(10),
lDEPARTMENT VARCHAR(10),
lSALARY number(9,2),
lGENDER char(6),
lAGE NUMBER(2), 
lCITY VARCHAR(10)) ;

insert into lg_employee select * from tcs_employee ;
select * from lg_employee ;

create table samsung_employee as select * from tcs_employee ;
select * from samsung_employee ;

create table wipro_employee as select * from tcs_employee  where 1=0;
desc wipro_employee ;

--Merge Command
INSERT INTO tcs_employee VALUES (1011, 'kumar', 'IT', 55000, 'Male', '27', 'London');
INSERT INTO tcs_employee VALUES (1012, 'Santosh', 'HR', 70000, 'Female', '29', 'Mumbai');
select * from tcs_employee ;
DELETE from tcs_employee WHERE ID = 1012 ;
select * from lg_employee ;

merge into lg_employee l using tcs_employee t on (t.ID = l.lID)
when matched then
update set l.lNAME=t.NAME,l.lDEPARTMENT=t.DEPARTMENT,l.lSALARY=t.SALARY,l.lGENDER=t.GENDER,l.lAGE=t.AGE,l.lCITY=t.CITY
when not matched then
insert (l.lid,l.lname,l.ldepartment,l.lsalary,l.lgender,l.lage,l.lcity) values (t.id,t.name,t.department,t.salary,t.gender,t.age,t.city);

update tcs_employee set gender='Male' where name='Santosh' ;
select * from lg_employee ;

--Operator
select id,name,salary,salary+2000 from tcs_employee ;
select id eid,name,salary,salary+2000 Incremented_salary from  tcs_employee ;
select id,name,salary,salary+2000 as Incremented_salary from tcs_employee ;
select id,name,salary,salary+2000 "Incremented salary" from tcs_employee ;
select id,name,salary,salary-250 "Decremented salary" from tcs_employee ;
select id,name,salary,salary*2 "Doubled salary" from tcs_employee ;
select id,name,salary,salary/2 "Half salary" from tcs_employee ;
select * from tcs_employee where GENDER='Male' ;
select * from tcs_employee where GENDER!='Male' ;
select * from tcs_employee where salary>45000 ;
select * from tcs_employee where salary>=50000 ;
select * from tcs_employee where salary<50000 ;
select * from tcs_employee where salary<=50000 ;
select * from tcs_employee where gender='Male' AND department='IT' ;
select * from tcs_employee where age=26 AND department='IT' ;
select * from tcs_employee where age=25 OR age=26 ;
select * from tcs_employee where age=10 OR age=15 ;
select * from tcs_employee where NOT city='London' ;
select * from tcs_employee where salary>=27000 AND salary<=30000 OR NOT city='Mumbai' ;

select * from tcs_employee where id=1001 OR id=1005 OR id=1010 ;

--Special Operator

select * from tcs_employee where id in(1001,1005,1010) ;
select * from tcs_employee where department not in('HR','Finance') ;
update tcs_employee set salary=salary+2000 where id in(1001,1003,1004);
select * from tcs_employee where salary between 30000 and 70000 ; 
select * from tcs_employee where age not between 30000 and 70000 ;  

select * from tcs_employee where name like '%p' ;
select * from tcs_employee where name like '%ai' ;
select * from tcs_employee where name like '%am%' ;
select * from tcs_employee where city like 'Londo_' ;
select * from tcs_employee where name like '_i%' ; 

select * from tcs_employee where name not like '%p' ;
select * from tcs_employee where name not like '%ai' ;
select * from tcs_employee where name not like '%am%' ;
