#TRIGGERS AND EVENTS

# Triggers is a piece of a code or statement that executes automatically when the event takes place on a specific table.
# To update a tble when changes on some other table takes place having corresponding info as that table 

delimiter $$
 create trigger company_name_add
 after insert on shippers
 for each row
 begin 
 insert into suppliers(companyname)
 values (new.companyname);
 end $$
 
 insert into shippers(companyname)
 values('TechMahindra');
 
 
 
 #Events Events in MySQL are tasks that run according to a defined Schedule. events are executed based on schedule 
 # so it is also called a Scheduled event.
 # The event can be used for various optimization over collected data on a frequent basis like weekly, or monthly. 
 # It can be used to track various details on available data.
 # This is used to maintain a large eCommerce-based database where there is a need of monitoring the stock units of available products. 
 # It can be used to clean up log records of the visiting users on-site weekly or after a certain time,
 
 
 create event delete_retires
 on schedule every 1 month seconds
 do
 begin 
 delete 
 from employee_demographics
 where afe>= 60;
 end $$
 
 show variables like 'event%';