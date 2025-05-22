# Procedures 
create procedure high_salaries()
select *
from employees
where salary>=2000;

call high_salaries;


#using delimiter sign with begin and end

delimiter $$
create procedure mid_salaries()
begin
select *
from employees
where salary>=1000;
select *
from employees
where salary<=2000;
end $$


call mid_salaries;

#parameters: parameters are the variables that are passed as an input to the stored procedures
# it can't be string, can't be char only integer values are accepted


delimiter $$
create procedure Distinct_employees(E_employeeid int)
begin
select concat(firstname," ",lastname) as FullName, Salary as Salary
from employees
where employeeid=E_employeeid;
end $$

call Distinct_employees(3);
