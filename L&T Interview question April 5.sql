drop table employee 

create table employee 
(
emp_name varchar(10),
dep_id int,
salary int
);
delete from employee;
insert into employee values 
('Siva',1,30000),('Ravi',2,40000),('Prasad',1,50000),('Sai',2,20000);


SELECT * FROM EMPLOYEE

--SQL Query to find highest and lowest salary in each department--


WITH CTE1 AS
(
SELECT DEP_ID,SALARY,
DENSE_RANK() OVER (PARTITION BY DEP_ID ORDER BY SALARY DESC)AS DRNK
FROM EMPLOYEE),
CTE2 AS
(
SELECT DEP_ID,SALARY,
DENSE_RANK()OVER(PARTITION BY DEP_ID ORDER BY SALARY)AS ARNK
FROM EMPLOYEE)

SELECT a.dep_id, a.salary as highest_salary, b.salary as lowest_salary
from CTE1 as a
join CTE2 as b
on a.dep_id=b.dep_id
where DRNK=1 AND ARNK=1




--CONCEPT IS GET THE HIGHEST SALARY IN EACH DEPARTMENT IN FIRST CTE--
--GET THE LOWEST SALARY IN EACH DEPARTMENT IN SECOND CTE--
--JOIN THOSE 2 CTES--
