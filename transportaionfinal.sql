CREATE DATABASE transportationManagementSystem2;
use transportationManagementSystem2 ;

drop table SystemUser;

CREATE TABLE SystemUser(
	USERID INT IDENTITY(1,1) PRIMARY KEY,
	NAME VARCHAR(50) NOT NULL,
	PHONE INT NOT NULL,
	RATING INT NOT NULL	CHECK(RATING <= 5 ),
	STATUS INT NOT NULL, 
	-- 1-ONLINE OR 2-OFLINE - FOR RIDER
	--- 1- ONRIDE 2- WAITING 3- WAITING 
	GENDER INT NOT NULL 
	-- 1-MALE 2-FEMALE AND 3-OTHER
);
alter table SystemUser add
truncate table SystemUser;
select * from SystemUser;


insert into SystemUser (NAME,PHONE ,RATING,STATUS,GENDER)
Values('ASIF RAHMAN',0153435467,2,1,1),
	  ('ABDUR RAHMAN',0153435467,2,1,1),
	  ('NAYEEM RAHMAN',0153435467,2,1,1),
	  ('FARHAN TANVIR ROCKET',0153435467,2,2,1),
	  ('ASIF ADNAN',0153435467,2,1,1),
	  ('ABDUL KARIM',0153435467,2,1,1),
	  ('NAYEEM IBRAHIM',0153435467,2,1,1),
	  ('TASNUBA JAHAN',0153435467,2,1,2),
	  ('SAIF CHOWDHURY',0153435467,2,2,1),
	  ('FAED CHOWDHURY',0153435467,2,1,1),
	  ('ASIF RAHMAN',0153435467,2,1,1),
	  ('ABDUR RAHMAN',0153435467,2,1,1),
	  ('NAYEEM RAHMAN',0153435467,2,1,1),
	  ('FARHAN ADNAN ROCKET',0153435467,2,2,1),
	  ('ASIF ADNAN',0153435467,2,1,1),
	  ('ABDUL KARIM',0153435467,2,1,1),
	  ('NAYEEM CHOWDHURY',0153435467,2,2,1),
	  ('TASMIA JAHAN',0153435467,2,1,2),
	  ('SAIF KARIM',0153435467,2,1,1),
	  ('FAED ADNAN',0153435467,2,1,1);


select * from SystemUser;

drop table Rider;
truncate table Rider;

CREATE TABLE Rider(
	RiderId INT IDENTITY(1,1) PRIMARY KEY,
	Userid INT NOT NULL FOREIGN KEY REFERENCES SystemUser (Userid),
	VehicleType varchar(10) NOT NULL,
	-- 1-bike 2-car 3-large -- 
	Vehicledetails varchar(30) NOT NULL,
	-- vehicle name, company -- 
	VehicleNumber varchar(10) NOT NULL,
	-- vehicle number -- 

);

insert into Rider(Userid,VehicleType,Vehicledetails,VehicleNumber)
Values(1,'BIKE','BAJAJ','19-2132'),
	  (2,'BIKE','YAHAMA','19-2142'),
	  (3,'BIKE','HONDA','19-2152'),
	  (4,'CAR','TOYOTA PROBOX','19-2162'),
	  (5,'PREMIUM','HYUDAI','19-2232'),
	  (6,'BIKE','BAJAJ','18-2132'),
	  (7,'BIKE','YAHAMA','16-2142'),
	  (8,'BIKE','HONDA','19-1132'),
	  (9,'CAR','TOYOTA PROBOX','15-2132'),
	  (10,'PREMIUM','HYUDAI','19-2162');

select * from Rider;
--query--
SELECT Rider.RiderId,Rider.userid,SystemUser.NAME ,Rider.VehicleType,Rider.Vehicledetails,Rider.Vehicledetails
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID;

SELECT Rider.RiderId,Rider.userid,SystemUser.NAME ,Rider.VehicleType,Rider.Vehicledetails,Rider.Vehicledetails
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID where SystemUser.status=1;



		SELECT Rider.RiderId,Rider.userid,SystemUser.NAME ,Rider.VehicleType,Rider.Vehicledetails,Rider.Vehicledetails
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID where SystemUser.status=2;






-- TO BE NAMED PASSENGER -- 
DROP TABLE PASSENGER;
CREATE TABLE PASSENGER(
	PASSENGERID INT IDENTITY(1,1) PRIMARY KEY,
	Userid int NOT NULL FOREIGN KEY REFERENCES Systemuser (Userid),
	Work varchar(100) NULL,
	Home varchar(100) NULL
);
select * from passenger;
delete from bill where passengerid=3;
//delete from ride where (select request id where passengerid=3;
delete from request  where passengerid=3;
delete from passenger  where passengerid=3;
insert into PASSENGER(Userid,Work,Home)
Values(11,'DHAKA UNIVARSITY','SHANTINAGAR'),
		(12,'AHSANULLAH UNIVARSITY','SHANTINAGAR'),
		(13,'DAFFODIL UNIVARSITY','SHANTINAGAR'),
		(14,'DHAKA UNIVARSITY','SHANTINAGAR'),
		(15,'AHSANULLAH UNIVARSITY','SHANTINAGAR'),
		(16,'DAFFODIL UNIVARSITY','SHANTINAGAR'),
		(17,'DHAKA UNIVARSITY','SHANTINAGAR'),
		(18,'AHSANULLAH UNIVARSITY','SHANTINAGAR'),
		(19,'DAFFODIL UNIVARSITY','SHANTINAGAR'),
		(20,'AHSANULLAH UNIVARSITY','SHANTINAGAR');

select * from PASSENGER;
select * from SystemUser;
SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID;


-- TO BE NAMED STAFF -- 
DROP TABLE STAFF;
CREATE TABLE STAFF(
	STAFFID INT IDENTITY(1,1) PRIMARY KEY,
	Userid int NOT NULL FOREIGN KEY REFERENCES Systemuser (Userid),
	DESIGNATION varchar(20) NOT NULL,
	Home varchar(100) NULL

);

insert into STAFF(Userid,DESIGNATION,Home)
Values(14,'SENIOR EXECUTIVE','SHANTINAGAR'),
		(15,'PROJECT MANAGER','SHANTINAGAR');


		--(9,'AHSANULLAH UNIVARSITY','DEVELOPER','SHANTINAGAR'),--
		--(10,'AHSANULLAH UNIVARSITY','DATABASE ENGINEER','SHANTINAGAR'),--
		

select * from STAFF;


--query2--
SELECT STAFF.STAFFID,STAFF.userid,SystemUser.NAME ,STAFF.DESIGNATION,STAFF.Home
		FROM STAFF INNER JOIN SystemUser 
		ON STAFF.Userid=SystemUser.USERID;

		--query3 online offline of passenger--
		select * from SystemUser;

		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID where SystemUser.status=1;

	
		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID where SystemUser.status=2;



		
		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID where SystemUser.status=3;

		--query4 online offline info of staff--
		SELECT STAFF.STAFFID,STAFF.userid,SystemUser.NAME ,STAFF.DESIGNATION,STAFF.Home
		FROM STAFF INNER JOIN SystemUser 
		ON STAFF.Userid=SystemUser.USERID;



		SELECT STAFF.STAFFID,STAFF.userid,SystemUser.NAME ,STAFF.DESIGNATION,STAFF.Home
		FROM STAFF INNER JOIN SystemUser 
		ON STAFF.Userid=SystemUser.USERID where SystemUser.status=1;


		SELECT STAFF.STAFFID,STAFF.userid,SystemUser.NAME ,STAFF.DESIGNATION,STAFF.Home
		FROM STAFF INNER JOIN SystemUser 
		ON STAFF.Userid=SystemUser.USERID where SystemUser.status=2;




		SELECT STAFF.STAFFID,STAFF.userid,SystemUser.NAME ,STAFF.DESIGNATION,STAFF.Home
		FROM STAFF INNER JOIN SystemUser 
		ON STAFF.Userid=SystemUser.USERID where SystemUser.status=3; 




		--real query5--
		---i have added systemuser.rating
		--rating order by passenger--
		--status=1 order by rating
		--order by (rating) asc and desc based on all status


		--passenger status=1 ordery by both asc and desc in respect to rating
		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home,SystemUser.RATING
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID where SystemUser.status=1 ORDER BY SystemUser.RATING;


		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home,SystemUser.RATING
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID where SystemUser.status=1 ORDER BY SystemUser.RATING desc;




	--passenger status=2 ordery by both asc and desc in respect to rating
		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home,SystemUser.RATING
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID where SystemUser.status=2 ORDER BY SystemUser.RATING;

		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home,SystemUser.RATING
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID where SystemUser.status=2 ORDER BY SystemUser.RATING desc;




		--passenger status=3 ordery by both asc and desc  in respect to rating
		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home,SystemUser.RATING
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID where SystemUser.status=3 ORDER BY SystemUser.RATING;


		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home,SystemUser.RATING
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID where SystemUser.status=3 ORDER BY SystemUser.RATING desc;


		--rider status=1 both asc and desc  in respect to rating--
		SELECT Rider.RiderId,Rider.userid,SystemUser.NAME ,Rider.VehicleType,Rider.Vehicledetails,Rider.Vehicledetails,SystemUser.RATING
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID where SystemUser.status=1 ORDER BY SystemUser.RATING;



		SELECT Rider.RiderId,Rider.userid,SystemUser.NAME ,Rider.VehicleType,Rider.Vehicledetails,Rider.Vehicledetails,SystemUser.RATING
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID where SystemUser.status=1 ORDER BY SystemUser.RATING desc;

		--rider status=2 both asc and desc  in respect to rating--
		SELECT Rider.RiderId,Rider.userid,SystemUser.NAME ,Rider.VehicleType,Rider.Vehicledetails,Rider.Vehicledetails,SystemUser.RATING
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID where SystemUser.status=2 ORDER BY SystemUser.RATING;



		SELECT Rider.RiderId,Rider.userid,SystemUser.NAME ,Rider.VehicleType,Rider.Vehicledetails,Rider.Vehicledetails,SystemUser.RATING
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID where SystemUser.status=2 ORDER BY SystemUser.RATING desc;

		--rider status=3 both asc and desc  in respect to rating--

		SELECT Rider.RiderId,Rider.userid,SystemUser.NAME ,Rider.VehicleType,Rider.Vehicledetails,Rider.Vehicledetails,SystemUser.RATING
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID where SystemUser.status=3 ORDER BY SystemUser.RATING;



		SELECT Rider.RiderId,Rider.userid,SystemUser.NAME ,Rider.VehicleType,Rider.Vehicledetails,Rider.Vehicledetails,SystemUser.RATING
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID where SystemUser.status=3 ORDER BY SystemUser.RATING desc;



		--staff--status=1 and orderby rating
		--status=1
		SELECT STAFF.STAFFID,STAFF.userid,SystemUser.NAME ,STAFF.DESIGNATION,STAFF.Home
		FROM STAFF INNER JOIN SystemUser 
		ON STAFF.Userid=SystemUser.USERID where SystemUser.status=1 order by SystemUser.RATING;

		SELECT STAFF.STAFFID,STAFF.userid,SystemUser.NAME ,STAFF.DESIGNATION,STAFF.Home
		FROM STAFF INNER JOIN SystemUser 
		ON STAFF.Userid=SystemUser.USERID where SystemUser.status=1 order by SystemUser.RATING desc;

		--status2
		SELECT STAFF.STAFFID,STAFF.userid,SystemUser.NAME ,STAFF.DESIGNATION,STAFF.Home
		FROM STAFF INNER JOIN SystemUser 
		ON STAFF.Userid=SystemUser.USERID where SystemUser.status=2  order by SystemUser.RATING;


		SELECT STAFF.STAFFID,STAFF.userid,SystemUser.NAME ,STAFF.DESIGNATION,STAFF.Home
		FROM STAFF INNER JOIN SystemUser 
		ON STAFF.Userid=SystemUser.USERID where SystemUser.status=2  order by SystemUser.RATING desc;

		--status3--

SELECT STAFF.STAFFID,STAFF.userid,SystemUser.NAME ,STAFF.DESIGNATION,STAFF.Home
		FROM STAFF INNER JOIN SystemUser 
		ON STAFF.Userid=SystemUser.USERID where SystemUser.status=3  order by SystemUser.RATING;


		SELECT STAFF.STAFFID,STAFF.userid,SystemUser.NAME ,STAFF.DESIGNATION,STAFF.Home
		FROM STAFF INNER JOIN SystemUser 
		ON STAFF.Userid=SystemUser.USERID where SystemUser.status=3  order by SystemUser.RATING desc;





		--query 6
		--wherer status= x and order by name


		

		--passenger status=1 ordery by both asc and desc in respect to name
		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home,SystemUser.RATING
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID where SystemUser.status=1 ORDER BY SystemUser.NAME;


		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home,SystemUser.RATING
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID where SystemUser.status=1 ORDER BY SystemUser.NAME desc;



		--passenger status=2 ordery by both asc and desc in respect to name
		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home,SystemUser.RATING
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID where SystemUser.status=2 ORDER BY SystemUser.Name;

		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home,SystemUser.RATING
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID where SystemUser.status=2 ORDER BY SystemUser.NAME desc;




		--passenger status=3 ordery by both asc and desc  in respect to Name
		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home,SystemUser.RATING
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID where SystemUser.status=3 ORDER BY SystemUser.NAME;


		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home,SystemUser.RATING
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID where SystemUser.status=3 ORDER BY SystemUser.NAME desc;






		--rider status=1 both asc and desc  in respect to name--
		SELECT Rider.RiderId,Rider.userid,SystemUser.NAME ,Rider.VehicleType,Rider.Vehicledetails,Rider.Vehicledetails,SystemUser.RATING
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID where SystemUser.status=1 ORDER BY SystemUser.Name;



		SELECT Rider.RiderId,Rider.userid,SystemUser.NAME ,Rider.VehicleType,Rider.Vehicledetails,Rider.Vehicledetails,SystemUser.RATING
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID where SystemUser.status=1 ORDER BY SystemUser.Name desc;

		--rider status=2 both asc and desc  in respect to rating--
		SELECT Rider.RiderId,Rider.userid,SystemUser.NAME ,Rider.VehicleType,Rider.Vehicledetails,Rider.Vehicledetails,SystemUser.RATING
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID where SystemUser.status=2 ORDER BY SystemUser.NAME;



		SELECT Rider.RiderId,Rider.userid,SystemUser.NAME ,Rider.VehicleType,Rider.Vehicledetails,Rider.Vehicledetails,SystemUser.RATING
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID where SystemUser.status=2 ORDER BY SystemUser.NAME desc;

		--rider status=3 both asc and desc  in respect to rating--

		SELECT Rider.RiderId,Rider.userid,SystemUser.NAME ,Rider.VehicleType,Rider.Vehicledetails,Rider.Vehicledetails,SystemUser.RATING
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID where SystemUser.status=3 ORDER BY SystemUser.NAME;



		SELECT Rider.RiderId,Rider.userid,SystemUser.NAME ,Rider.VehicleType,Rider.Vehicledetails,Rider.Vehicledetails,SystemUser.RATING
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID where SystemUser.status=3 ORDER BY SystemUser.NAME desc;



		SELECT STAFF.STAFFID,STAFF.userid,SystemUser.NAME ,STAFF.DESIGNATION,STAFF.Home
		FROM STAFF INNER JOIN SystemUser 
		ON STAFF.Userid=SystemUser.USERID where SystemUser.status=3  order by SystemUser.Name;



















		

		--query 5 the same thing with ratings
		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home,SystemUser.RATING
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID ORDER BY SystemUser.RATING;


		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home,SystemUser.RATING
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID ORDER BY SystemUser.RATING desc;


		SELECT PASSENGER.PASSENGERID,PASSENGER.userid,SystemUser.NAME ,PASSENGER.Work,PASSENGER.Home,SystemUser.RATING
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID ORDER BY SystemUser.RATING desc;


		--Rider
		SELECT Rider.RiderId,Rider.userid,SystemUser.NAME ,Rider.VehicleType,Rider.Vehicledetails,Rider.Vehicledetails
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID where SystemUser.status=1  ORDER BY SystemUser.RATING desc;







drop table RIDE;
CREATE TABLE RIDE(
	RideId INT IDENTITY(1,1) PRIMARY KEY,
	Status varchar(100) NOT NULL,
	RiderId INT NOT NULL FOREIGN KEY REFERENCES Rider (RiderId),
	
	RequestId int NOT NULL  FOREIGN KEY REFERENCES Request (RequestId),
	Start varchar(100) NOT NULL,
	Destination varchar(100) NOT NULL,
	TimePassed varchar(100) NOT NULL,

);

insert into Ride(Status,RiderId,Requestid,Start,Destination,TimePassed)
Values('started',2,3,'gulshan','shymoli','01-02'),
		('not started',4,5,'banani','banglamotor','00-52'),
		('finished',2,3,'60 feet','gulshan','01-02'),
			('started',7,3,'banglamotor','basundhara','01-40'),
			('not started',1,5,'gulshan','shymoli','00-40'),
				('started',6,3,'banani','shymoli','01-40'),
					('started',5,2,'gulshan','banglamotor','00-30'),
						('started',4,3,'gulshan','banglamotor','00-40'),
						('started',2,1,'60 feet','banglamotor','00-50');

select * from ride;
					select count(Riderid) from ride where status='started';
					

		






drop table REQUEST;
CREATE TABLE REQUEST(
	RequestId INT IDENTITY(1,1) PRIMARY KEY,
	Destination varchar(100) NOT NULL,
	Start varchar(100) NOT NULL,
	Accepted varchar(100) NOT NULL,
	Distance int not null,
	PaymentMethod varchar(100) NOT NULL,
	VehicleType varchar(100) NOT NULL,
	--Userid int NOT NULL FOREIGN KEY REFERENCES SystemUser (USERID),--
	PASSENGERID int NOT NULL FOREIGN KEY REFERENCES PASSENGER (PASSENGERID),--
);
truncate table request;
select * from request;
insert into REQUEST(Destination,Start,Accepted,Distance,PaymentMethod,VehicleType,PASSENGERID)
Values('shymoli','SHANTINAGAR','Accepted',10,'cash','bike',1),
	    ('banani','Banglamotor','Accepted',6,'Bkash','car',2),
		('Gulshan','60 feet','Waiting',13,'cash','bike',3),
		('Basundhara','kollanpur','Accepted',5,'cash','bike',4),
		('gabtoli','SHANTINAGAR','Waiting',1,'Bkash','premire',5),
		('Banglamotor','shymoli','Accepted',7,'cash','bike',1);
		select count(passengerid)  from request where Accepted='waiting';
		



drop table LOCATION;
CREATE TABLE LOCATION(
	Userid INT IDENTITY(1,1) PRIMARY KEY FOREIGN KEY REFERENCES SystemUser (USERID),
	FullAddress varchar(100) NOT NULL,
	Latitude varchar(100)  NULL,
	Longitude varchar(100)  NULL
);
insert into Location(FullAddress,Latitude,Longitude)
Values('shymoli',null,null),
('Banglamotor',null,null),
('banani',null,null),
('uttara',null,null),
('60 feet',null,null),
('gabtoli',null,null),
('mirpur',null,null),
('uttara',null,null),
('farmgate',null,null),
('banglamotor',null,null),
('eskaton',null,null),
('shymoli',null,null),
('banani',null,null),
('mohammadpur',null,null),
('uttara',null,null);

select * from location;
	   


select * from LOCATION;



--trying myself--
drop table PriceRules;
Create Table PriceRules(
	RuleId int IDENTITY(1,1) PRIMARY KEY,
	Distance varchar NOT NULL,
	ExtraTime varchar NOT NULL,
	VehicleType varchar NOT NULL,
	Price decimal (5,2),
	);


	drop table Bill;
	Create Table Bill(
	BillId int IDENTITY(1,1) PRIMARY KEY,
	Payment decimal(5,2),
	Paymentmethod varchar NOT NULL,
	Status varchar(100) NOT NULL,
	RiderRating int NOT Null,
	RiderReview varchar(100) NUll,
	PassengerRating int NOT NULL ,
	PassengerReview varchar(100) NUll,
	RiderId int NOT NULL FOREIGN KEY REFERENCES Rider (RiderId),
	PASSENGERID int NOT NULL FOREIGN KEY REFERENCES PASSENGER (PASSENGERID),

	);
	
	insert into Bill(payment,paymentmethod,status,RiderRating,RiderReview,PassengerRating,PassengerReview,RiderId,PassengerId)
Values(100,'bkash','started',2,'good',3,'vg',2,2);

drop table Bill;
Create Table Bill(
	BillId int IDENTITY(1,1) PRIMARY KEY,
	Payment decimal(5,2),
	Paymentmethod varchar(100) NOT NULL,
	status varchar(100) NOT NULL,
	RiderRating int NOT Null,
	RiderReview varchar(100) not  NUll,
	PassengerRating int NOT NULL ,
	PassengerReview varchar(100) not NUll,
	RiderId int NOT NULL FOREIGN KEY REFERENCES Rider (RiderId),
	PASSENGERID int NOT NULL FOREIGN KEY REFERENCES PASSENGER (PASSENGERID),

	);
	truncate table bill;
	insert into Bill(payment,paymentmethod,status,RiderRating,RiderReview,PassengerRating,PassengerReview,RiderId,PassengerId)
Values(100,'bkash','started',2,'good',3,'good',1,2),
(200,'cash','started',2,'good',3,'bad',3,2),
(150,'cash','started',2,'bad',3,'good',4,3),
(70,'bkash','started',2,'good',3,'bad',2,1),
(150,'bkash','started',2,'good',3,'bad',2,1),
(270,'bkash','started',2,'good',3,'bad',2,1),
(170,'bkash','started',2,'good',3,'bad',2,1);

select * from bill;
select top 1 Passengerid, max(payment) from Bill group by PASSENGERID;
select top 1 Passengerid from Bill group by PASSENGERID order by  sum(payment) desc;


select top 1 Passengerid from Bill group by PASSENGERID having max(payment) orderby  ;



--1--highest contributing
select name from SystemUser where userid in((select passengerid from passenger
 where passengerid in(select top 3 Passengerid from Bill
  group by PASSENGERID order by  sum(payment) desc)));
--2--
select name from SystemUser where userid in((select Riderid from Rider where riderid in(select top 3 riderid from Bill group by riderid order by  sum(payment) desc)));
--3--
select sum(payment)/5 from Bill ;
--0--total rider online question1


select count(userid) from Systemuser where userid in (SELECT Rider.RiderId
		FROM Rider INNER JOIN SystemUser 
		ON Rider.Userid=SystemUser.USERID where SystemUser.status=1);
--1--total passenger online question2



select count(userid) from Systemuser where userid in (SELECT PASSENGER.PASSENGERID
		FROM PASSENGER INNER JOIN SystemUser 
		ON PASSENGER.Userid =SystemUser.USERID 
 where SystemUser.status=1);
 --titak ride accepted
 	select passengerid from request where Accepted='Accepted';
	--total passenger waiting question4
	select count(passengerid)  from request where Accepted='waiting';
	--total ride happening question3
	select count(Riderid) from ride where status='started';




drop table Bills3;
Create Table Bills3(
	BillId int IDENTITY(12,1) PRIMARY KEY,
	
	Paymentmethods varchar(100) NOT NULL,
	
	

	);
	
	insert into Bills3(paymentmethods)
Values('bkash');







		
	select * from bill;
	select * from rider;
	select * from PASSENGER;





