create table employees1
(
emp_id int primary key, 
emp_name varchar(20),
emp_salary int, 
dep_id int
)

insert into employees1
values(1,'Raj',15000,100),
(2,'Rohan',25000,100),
(3,'Ankit',25690,100),
(4,'Puja',20000,100),
(5,'Arun',58000,200),
(6,'Tarun',65000,200),
(7,'Pintu',45800,200),
(8,'Ankur',25000,300),
(9,'Ajay',17000,300),
(10,'Amrin',37500,400);

select * from employees1


--3rd highest salary of each department--
--If there are less than 3 employees return lowest employee salary--

WITH CTE AS(
SELECT *,
COUNT(emp_id) OVER (PARTITION BY dep_id)AS number_of_emp,
dense_rank() OVER (PARTITION BY dep_id ORDER by emp_Salary desc)AS DRNK,
dense_rank() OVER (PARTITION BY dep_id ORDER by emp_Salary desc) AS ARNK
FROM employees1)
select emp_name,emp_salary from cte
where DRNK=3
union
select emp_name, emp_salary from cte
where  number_of_emp<3 and ARNK=1


