create database Zomato;
use zomato;
create table Restaurants(
     RestaurantsID int primary key,
     Name varchar(50),
     city varchar(50),
     CuisineType enum ('Indian','Chinese','Italian'),
     Rating decimal(2,1),
     AverageCostForTwo decimal(10,2));
          
alter table Restaurants modify column RestaurantsID INT auto_increment;
     
INSERT INTO Restaurants (Name, City, CuisineType, Rating, AverageCostForTwo)
VALUES('Taj', 'Mumbai', 'Indian', 4.5, 400.00);

INSERT INTO Restaurants (Name, City, CuisineType, Rating, AverageCostForTwo)
VALUES
('A1 Plazza', 'Ashoknagar', 'Italian', 4.2, 35.50),
('Bhati Dhaba', 'Ashoknagar', 'Chinese', 4.7, 50.00),
('Satnam', 'Indore', 'Indian', 4.3, 45.00),
('Guru Kirpa', 'Indore', 'Indian', 4.3, 30.00),
('Bapu ki Kutiya', 'Indore', 'Indian', 3.0, 10.00),
('Farmar Food', 'Ashoknagar', 'Chinese', 5.0, 90.00),
('Rajkamal', 'Indore', 'Italian', 4.1, 20.00),
('Pandatji', 'Indore', 'Chinese', 4.8, 60.00),
('Dev Bhojananala', 'Indore', 'Indian', 5.0, 600.00);

select * from Restaurants;

create table Customers(
     CustomerID int primary key,
     FirstName varchar(50),
     LastName varchar(20),
	 Phone VARCHAR(15), 
     City VARCHAR(100),
     JoinDate DATETIME);
     
alter table Customers modify column CustomerID INT auto_increment;

INSERT INTO Customers (FirstName, LastName, Phone, City, JoinDate)
VALUES
('Dev', 'Sharma', '7470974474', 'Mumbai', '2024-05-01 10:30:00'),
('Prince', 'Sharma', '6264728631', 'Ashoknagar', '2023-11-12 14:15:00'),
('Anmol', 'Sharma', '8827441966', 'Ashoknagar', '2022-03-25 09:00:00'),
('Sumit', 'Sharma', '8827442966', 'Indore', '2023-08-19 16:45:00'),
('Sanjay', 'shrivas', '9876543456', 'Indore', '2024-02-10 12:20:00'),
('Sachin', 'yadav', '789654565', 'Indore', '2023-07-30 11:10:00'),
('Akku', 'sharma', '555-2468', 'Ashoknagar', '2024-01-25 18:30:00'),
('Chanchal', 'Sharma', '7773087561', 'Mumbai', '2022-11-17 13:55:00'),
('Mayank', 'jatav', '9876545656', 'Indore', '2023-05-05 08:40:00'),
('Bitta', 'Pawar', '8976732576', 'Ashoknagar', '2024-04-13 19:50:00');

select * from Customers;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,          
    CustomerID INT,                   
    RestaurantsID INT,                 
    OrderDate DATETIME,               
    OrderAmount DECIMAL(10, 2),       
    OrderStatus enum('Delivered','Cancelled','Pending'),          
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantsID) REFERENCES Restaurants(RestaurantsID)
);


alter table Orders modify column OrderID INT auto_increment;

INSERT INTO Orders (CustomerID,RestaurantsID,OrderDate, OrderAmount, OrderStatus)
VALUES
(1,2,'2024-05-01 12:30:00', 50.75, 'Delivered'),
(2,10,'2023-11-12 19:45:00', 72.20, 'Pending'),
(3,7,'2022-03-25 14:00:00', 35.40, 'Delivered'),
(4,6,'2023-08-19 20:10:00', 62.00, 'Cancelled'),
(5,2,'2024-02-10 11:20:00', 25.60, 'Pending'),
(6,4,'2023-07-30 18:30:00', 90.00, 'Delivered'),
(7,6,'2024-01-25 13:50:00', 48.00, 'Pending'),
(8,9,'2022-11-17 17:15:00', 56.80, 'Delivered'),
(9,3,'2023-05-05 11:00:00', 32.50, 'Cancelled'),
(10,1,'2024-04-13 20:00:00', 41.30, 'Pending');

select * from Orders;

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,          
    CustomerID INT,                    
    RestaurantsID INT,                   
    Rating DECIMAL(2, 1),               
    Comment TEXT,                      
    ReviewDate DATETIME,                
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantsID) REFERENCES Restaurants(RestaurantsID) 
);

alter table Reviews modify column ReviewID INT auto_increment;

INSERT INTO Reviews (CustomerID, RestaurantsID, Rating, Comment, ReviewDate)
VALUES
( 1, 2, 4.5, 'Great food and friendly service. Highly recommend the butter chicken!', '2024-01-10 13:00:00'),
( 2, 3, 4.0, 'Delicious Chinese food, but a bit pricey. Still worth it!', '2023-11-28 19:30:00'),
( 3, 4, 5.0, 'The best Indian food in the city! The naan was perfect.', '2024-02-15 14:30:00'),
( 4, 1, 3.5, 'Good pizza but the crust was a little too thick for my taste.', '2023-08-19 21:00:00'),
( 5, 2, 4.0, 'Nice pasta dishes. The ambiance was great but service was slow.', '2024-02-12 17:45:00'),
( 6, 3, 5.0, 'Excellent! Fresh ingredients and quick delivery. Will order again.', '2023-09-20 12:00:00'),
( 7, 5, 4.2, 'Good food, though I found the portion size a bit small for the price.', '2024-01-22 14:10:00'),
( 8, 4, 4.7, 'Really enjoyed the food. Friendly staff and cozy atmosphere.', '2022-12-12 16:20:00'),
( 9, 2, 3.0, 'The food was okay, but the place was too noisy for a relaxed dinner.', '2023-05-25 20:40:00'),
( 10, 5, 4.8, 'Amazing service and delicious food! I’ll be coming back for sure.', '2024-04-16 18:15:00');


select * from Reviews;

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,            
    OrderID INT,                          
    PaymentMethod ENUM('Card','Cash','Wallet','UPI')NOT NULL DEFAULT 'Cash',        
    Amount DECIMAL(10, 2),                
    PaymentDate DATETIME,               
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


alter table Payments modify column PaymentID INT auto_increment;

INSERT INTO Payments (OrderID, PaymentMethod, Amount, PaymentDate)
VALUES
( 1, 'UPI', 50.75, '2024-01-10 13:15:00'),
( 2, 'Cash', 72.20, '2023-11-28 19:45:00'),
( 3, 'UPI', 35.40, '2024-02-15 14:45:00'),
( 4, 'Wallet', 62.00, '2023-08-19 21:05:00'),
( 5, 'Card', 25.60, '2024-02-12 18:00:00'),
( 6, 'UPI', 90.00, '2023-09-20 12:15:00'),
( 7, 'Wallet', 48.00, '2024-01-22 14:25:00'),
( 8, 'UPI', 56.80, '2022-12-12 16:30:00'),
( 9, 'Cash', 32.50, '2023-05-25 20:45:00'),
( 10, 'Card', 41.30, '2024-04-16 18:30:00');



select * from Payments;

-- query for question-- 

SELECT Name,Rating FROM Restaurants WHERE   Rating >= 4.5

SELECT CustomerID, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY CustomerID;

SELECT RestaurantsID, Name, City, CuisineType, Rating
FROM Restaurants
WHERE CuisineType = 'Italian' AND City = 'Indore';

SELECT o.RestaurantsID,r.Name,r.City from Orders o inner join Restaurants r on r.RestaurantsID=o.RestaurantsID WHERE OrderStatus='Delivered'

SELECT c.firstname,o.OrderID,max(o.OrderDate) from Orders o inner join Customers c on o.CustomerID=c.CustomerID group by o.orderID
limit 5;

SELECT c.CustomerID,o.OrderID,c.Firstname from Customers c inner join Orders o on o.CustomerID=c.CustomerID WHERE o.orderid is not null

SELECT r.reviewid,rs.Name count(r.reviewid) as reviewcount from Reviews r inner join Restaurants rs on r.RestaurantsID=rs.RestaurantsID group by rs.RestaurantsID 

SELECT r.RestaurantsID, r.Name, r.City, r.CuisineType, COUNT(rv.ReviewID) AS ReviewCount
FROM Restaurants r
JOIN Reviews rv ON r.RestaurantsID = rv.RestaurantsID
GROUP BY r.RestaurantsID, r.Name, r.City, r.CuisineType
ORDER BY ReviewCount DESC;

select paymentmethod,count(*) as paymentcount
from payments 
group by paymentmethod
order by paymentmethod desc
limit 2;

SELECT r.RestaurantsID,r.name,r.city,o.orderid,sum(p.amount) from Restaurants r inner join Orders o on r.RestaurantsID=o.RestaurantsID
 join payments p on p.orderid=o.orderid GROUP BY r.RestaurantsID, p.orderid
 ORDER BY RestaurantsID DESC;


SELECT o.orderid, o.orderdate, o.orderstaturs, 
       r.name AS resturants_name, c.firstname AS custumores_name
FROM orders o
JOIN Restaurants r ON o.orderid = r.Restaurants
JOIN Customers c ON o.CustomerID = r.CustomerID
WHERE o.OrderStatus = 'Cancelled';


