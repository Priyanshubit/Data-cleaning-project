# CTEs (Common Table Expressions): is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement. 
# It improves readability and simplifies complex queries by breaking them into smaller, manageable parts.
#  CTEs help with hierarchical data representation, improve code reusability, and simplify maintenance.
#  CTEs are defined using the WITH clause and can be referenced multiple times within the main SQL query

with cte_example (Vorname, Avg_Gehlat, Sum_Gehalt) as
(
select firstname, avg(salary) over() as avgsalary, sum(salary) over() as totalsalary
from employees
)
select *
from cte_example;




with cte_example2 as 
( select firstname as Vorname, employeeid as Personal_Ausweis, salary as Gehalt
from employees
where hiredate> '1994-01-01'
),
cte_example3 as 
( select lastname as Nachname, employeeid as Personal_ausweis, salary as Gehalt
from employees
where birthdate> '1960-01-01'
)

select *
from cte_example2
join cte_example3 on cte_example2.Personal_ausweis=cte_example3.Personal_ausweis;



#2 Use a CTE to calculate total order amount per customer, then select only those with totals over $10,000.

with cte_total(Name, Totals) as
( select contactname, sum(quantity*unitprice) as totals
from customers
join orders on customers.customerid=orders.customerid
join orderdetails on orders.orderid=orderdetails.orderid
group by contactname
)
select *
from cte_total
where totals>10000;



#3 Create a CTE that calculates employee age and filters out those under 30.

with cte_delulu (FULLNAME, DOB, AGE) as
( select concat(firstname," ", lastname), birthdate, timestampdiff(year,birthdate,curdate()) as age
from employees
)
select * 
from cte_delulu
where AGE>=30;




#4 Use a CTE to get the top 5 customers by number of orders.

with cte_delulu (Fullname, Total_Orders) as
( select contactname, count(orders.orderid) as Total_Orders
from customers
join orders on customers.CustomerID=orders.CustomerID
group by contactname
)
select * 
from cte_delulu
order by Total_Orders desc
limit 5;


#5 Join a CTE (with product category sales) to the Categories table for additional info.

with cte_joinit as
( select orderdetails.orderid, categories.CategoryID, products.productid, orderdetails.unitprice, products.productname, products.unitsonorder
from orderdetails
join products on orderdetails.productid=products.productid
join categories on products.CategoryID=categories.CategoryID
), cte_joinit2 as
(select *
from categories)

select *
from cte_joinit
join cte_joinit2 on cte_joinit.categoryid=cte_joinit2.categoryid;



#6 Use a recursive CTE to simulate a simple number series from 1 to 10.
