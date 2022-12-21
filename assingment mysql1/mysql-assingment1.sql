use edyoda1;
create table SalesPeople(Snum int Primary key,Sname varchar(200) unique,City varchar(50),Comm int);
insert into SalesPeople values(1001,'Peel','London',12),
(1002,'Serres','Sanjose',13),
(1004,'Motika','London',11),
(1007,'Rifkin','Barcelona',15),
(1003,'Axelrod','Newyork',10);
select * from SalesPeople;
drop table SalesPeople;

create table Customers(Cnum int Primary key,Cname varchar(200),City varchar(100) not null,Snum int,
foreign key(Snum) references Salespeople(Snum));
insert into Customers values(2001,'Hoffman','London',1001),
(2002,'Giovanni','Rome',1003),
(2003,'Liu','Sanjose',1002),
(2004,'Grass','Berlin',1002),
(2006,'Clemens','London',1001),
(2008,'Cisneros','Sanjose',1007),
(2007,'Pereira','Rome',1004);
select * from Customers;
drop table customers;

create table orders(Onum int Primary Key,Amt float,Odate  Date,Cnum int,Snum int,
Foreign Key (Cnum) References Customers (Cnum),
foreign key (Snum) References SalesPeople(Snum));
drop table orders;
insert into Orders values(3001,18.69,'1990-10-03',2008,1007),
(3003,767.19,'1990-10-03',2001,1001),
(3002,1900.10,'1990-10-03',2007,1004),
(3005,5160.45,'1990-10-03',2003,1002),
(3006,1098.16,'1990-10-03',2008,1007),
(3009,1713.23,'1990-10-04',2002,1003),
(3007,75.75,'1990-10-04',2002,1002),
(3008,4273.00,'1990-10-05',2006,1001),
(3010,1309.95,'1990-10-06',2004,1002),
(3011,9891.88,'1990-10-06',2006,1001);
select * from orders;

#1 Count the number of salesperson whose name starts with 'a'/'A' 
select count(Sname) from SalesPeople where Sname like'A%' or'a%';

#2 Display all the sales person whose all orders worth is more than rs.2000.alter.
Select S.Sname,O.amt
from SalesPeople S 
Left join Orders O 
On S.Snum=O.Snum 
Where O.Amt > 2000
Order by O.Amt;

#3 Count the number of salesPerson belonnging to Newyork. 
 Select count(*) Nybased from SalesPeople where city= 'Newyork';
 
 #4 Display the number of sales people belonging to london and belonging to Paris. 
 Select * from salespeople where city ='London' or City='Paris';
 
 #5Display the number of orders taken by each Salesperson and their date oof orders. 
 Select S.Sname,O.Odate,Count(O.ODate) AS No_Of_Orders
 from SalesPeople s 
 left join Orders O 
 on S.Snum = O.SNum 
 Group By S.Sname,O.Odate;


