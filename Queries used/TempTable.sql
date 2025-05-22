#6. Temporary Tables

create temporary table tempt0
(Fullname varchar(50), Age integer(4), Favmovie varchar(100) );

insert into tempt0
values( 'Priyanshu', 23, 'Intersteller');

select *
from tempt0;


create temporary table High_paid_employees11
select *
from employees
where salary>3000;

select *
from High_paid_employees11;



# 1 Create a temporary table to store top 10 most expensive products.
# 2 Populate a temp table with customers who placed more than 5 orders.
# 3 Use a temp table to store employees with total sales > $5000, and query it for ranks.
# 4 Create a temp table to hold aggregated product sales per category, then filter by category name.
# 5 Create and use a temp table inside a stored procedure for intermediate order data.