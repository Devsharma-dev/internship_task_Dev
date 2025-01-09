create database ola;
use ola;
CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,       -- Unique identifier for the driver
    FirstName VARCHAR(50),          -- First name of the driver
    LastName VARCHAR(50),           -- Last name of the driver
    Phone VARCHAR(15),              -- Phone number of the driver
    City VARCHAR(100),              -- City where the driver is located
    VehicleType VARCHAR(20),        -- Type of vehicle ('Sedan', 'Hatchback', 'SUV', etc.)
    Rating DECIMAL(2, 1)            -- Rating out of 5 (e.g., 4.5)
);
INSERT INTO Drivers (FirstName,LastName,Phone,City,VehicleType,Rating)
VALUES ('sudakar', 'sukhla', '9456789987', 'indore','car',4.3);

alter table Drivers modify column DriverID INT auto_increment;
select * from Drivers;
CREATE TABLE Riders(
     RiderID INT PRIMARY KEY,
     FirstName VARCHAR(50),          
     LastName VARCHAR(50),          
     Phone VARCHAR(15),             
     City VARCHAR(100), 
     JoinDate DATETIME);
alter table Riders modify column RiderID INT auto_increment;
INSERT INTO Riders (FirstName, LastName, Phone, City, JoinDate)
VALUES ('Akku', 'sharma', '6264728631', 'Ashoknagar', '2020-06-04 12:20:00');
select * from Riders;
CREATE TABLE Rides (
    RideID INT PRIMARY KEY,           -- Unique identifier for each ride
    RiderID INT,                      -- Foreign key referencing the rider (user who booked the ride)
    DriverID INT,                     -- Foreign key referencing the driver (who is providing the ride)
    RideDate DATETIME,                -- Date and time when the ride took place
    PickupLocation VARCHAR(100),      -- Pickup location of the ride
    DropLocation VARCHAR(100),        -- Drop-off location of the ride
    Distance DECIMAL(6, 2),           -- Distance of the ride in kilometers
    Fare DECIMAL(10, 2),              -- Fare of the ride
    RideStatus ENUM('Completed', 'Cancelled', 'Ongoing') NOT NULL DEFAULT 'Ongoing',  -- Status of the ride
    FOREIGN KEY (RiderID) REFERENCES Riders(RiderID),  -- Foreign key to the Riders table
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID) -- Foreign key to the Drivers table
);
alter table Rides modify column RideDate timestamp default current_timestamp;
INSERT INTO Rides ( RiderID, DriverID, PickupLocation, DropLocation, Distance, Fare, RideStatus)
VALUES (10, 10, 'purana bazar', 'ghar', 5.9, 15.00, 'Completed');
select * from rides;
CREATE TABLE Payment(
	PaymentID INT PRIMARY KEY,
	RideID INT,
    PaymentMethod ENUM('Card','Cash','Wallet','UPI')NOT NULL DEFAULT 'Cash',
    Amount decimal(10,2),
    PaymentDate datetime,
	FOREIGN KEY (RideID) REFERENCES Rides(RideID));
INSERT INTO Payment (RideID,PaymentMethod,Amount,PaymentDate)
VALUES (10,'UPI',952.57,'2023-3-1 08:17:20');  
SELECT * FROM Payment;

SELECT FirstName, Rating,Phone FROM Drivers WHERE   Rating >= 4.5

select RideID,FirstName from Rides,Drivers  where RideStatus='Completed'

SELECT r.RiderID, r.Firstname FROM riders r LEFT JOIN rides ri ON r.riderid = ri.riderid WHERE ri.rideid IS NULL;

select d.firstname,r.RideID,sum(p.Amount) from Payment p inner join Rides r on r.rideid = p.rideid inner join Drivers d on d.driverid=r.driverid where r.RideStatus='completed'  group by r.RideID 

select ri.firstname,r.rideid from riders ri inner join rides r on ri.riderid=r.rideid where r.ridedate=1

select r.riderID,rd.firstname,max(r.RideDate) from Rides r inner join Riders rd ON r.RiderID=rd.RiderID group by rd.riderID;

SELECT rd.city, COUNT(*) AS ridecount
FROM rides r inner join riders rd on rd.riderid=r.rideid
GROUP BY rd.city
ORDER BY ridecount DESC;

select * from Rides where distance>10;

select paymentmethod,count(*) as paymentcount
from payment 
group by paymentmethod
order by paymentmethod desc
limit 1;

select r.driverid,count(*)from rides r inner join payment p on r.rideid=p.rideid group by driverid
limit 3;

SELECT driverid, SUM(fare) AS total_earnings
FROM rides,payment
GROUP BY driverid
-- ORDER BY fare DESC-- 
LIMIT 3;


SELECT r.rideid, r.ridedate, r.ridestatus, 
       rid.firstname AS rider_name, drv.firstname AS driver_name
FROM rides r
JOIN riders rid ON r.riderid = rid.riderid
JOIN drivers drv ON r.driverid = drv.driverid
WHERE r.ridestatus = 'cancelled';
