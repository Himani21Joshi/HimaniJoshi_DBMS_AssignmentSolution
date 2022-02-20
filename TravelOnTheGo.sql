create database if not exists `TravelOnTheGO`;
use `TravelOnTheGO`;

create table if not exists passenger(PASSENGER_NAME varchar (50),
CATEGORY varchar (30),
GENDER varchar (5),
BOARDING_CITY varchar (50),
DESTINATION_CITY varchar (50),
DISTANCE int not null,
BUS_TYPE varchar(50));

create table if not exists price(BUS_TYPE varchar(50),
DISTANCE int not null,
PRICE int null);

Insert into passenger values 
('Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', '350', 'Sleeper'),
('Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', '700', 'Sitting'),
('Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', '600', 'Sleeper'),
('Khusboo', 'AC', 'F', 'Chennai' ,'Mumbai', '1500','Sleeper'),
('Udit','Non-AC', 'M', 'Trivandrum', 'Panaji', '1000', 'Sleeper'),
('Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', '500', 'Sitting'),
('Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', '700', 'Sleeper'),
('Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', '500', 'Sitting'),
('Piyush', 'AC', 'M', 'Pune', 'Nagpur', '700', 'Sitting');

Insert into price values 
('Sleeper','350','770'),
('Sleeper','500','1100'),
('Sleeper','600','1320'),
('Sleeper','700','1540'),
('Sleeper','1000','2200'),
('Sleeper','1200','2640'),
('Sleeper','1500','2700'),
('Sitting','500','620'),
('Sitting','600','744'),
('Sitting','700','868'),
('Sitting','1000','1240'),
('Sitting','1200','1488'),
('Sitting','1500','1860');

Select Gender, count(Gender) from passenger where distance >=600
group by Gender;

Select min(Price) from price
where Bus_type = 'Sleeper';

Select Passenger_name from passenger
where Passenger_name like 'S%';

Select p.Passenger_name, p.Boarding_city, p.Destination_City, p.Bus_Type, pr.price from passenger as p
join price as pr on p.Distance = pr.Distance
group by p.Passenger_name;

Select p.Passenger_name, pr. Price from passenger as p 
join Price as pr on
p.Bus_type = pr.Bus_type  
where p.Distance >1000 and p.Bus_Type = 'Sitting';

SELECT DISTINCT p1.Passenger_name, p1.Boarding_city as Destination_city, p1.Destination_city as 
Boardng_city, p2.Bus_type, p2.Price FROM passenger p1, price p2 WHERE 
Passenger_name = 'Pallavi' and p1.Distance = p2.Distance;

Select distinct(Distance) 
from passenger
order by Distance desc;

Select passenger_name,(distance/(select sum(distance) from passenger))*100 as percentage
from passenger;

SELECT passenger.distance, Price.price,
CASE
	WHEN Price.price > 1000 THEN "Expensive"
    WHEN Price.price < 1000 and price > 500 THEN "Average_Cost"
    ELSE "Cheap"
END as Price_Catergory
FROM passenger join Price on passenger.distance = price.distance
group by passenger.distance;