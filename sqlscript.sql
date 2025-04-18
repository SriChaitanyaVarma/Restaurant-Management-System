REM   Script: pbl
REM   pbl

CREATE TABLE Restaurant(R_id int primary key,Name varchar(40));

INSERT INTO Restaurant values(101,'House of Biriyanis');

CREATE TABLE Customer(C_id int primary key,   
    R_id int,  
    C_name varchar(30) not null,  
    ph_no  int ,  
    foreign key(R_id) references Restaurant(R_id));

INSERT INTO Customer values(23,101,'Chaitanya',8096714333);

INSERT INTO Customer values(56,101,'Dhanyasri',9876714903);

INSERT INTO Customer values(89,101,'Nikhita',9876500981);

INSERT INTO Customer values(91,101,'Jagadeesh',7245009872);

CREATE TABLE Orders(O_id int primary key,  
    C_id int,  
    O_date date,  
    foreign key(C_id) references Customer(C_id));

INSERT INTO Orders values(1,23,'24-JUNE-24');

INSERT INTO Orders values(2,56,'24-JUNE-24');

INSERT INTO Orders values(3,89,'24-JUNE-24');

INSERT INTO Orders values(4,91,'24-JUNE-24');

CREATE TABLE Order_details(  
  C_id int,  
  O_id int, 
  Item_id int, 
  Item_name varchar(30), 
  Quantity int check(Quantity >0),  
  PRIMARY KEY (Item_id, O_id),  
  FOREIGN KEY (C_id) REFERENCES Customer(C_id),  
  FOREIGN KEY (O_id) REFERENCES Orders(O_id)  
);

select * from customer;

select * from Orders;

INSERT INTO Order_details values(23,1,2233,'Veg Biriyani',2);

INSERT INTO Order_details values(23,1,2234,'Chicken Biriyani',1);

INSERT INTO Order_details values(56,2,2234,'Chicken Biriyani',2);

INSERT INTO Order_details values(89,3,2244,'Prawns Biriyani',1);

INSERT INTO Order_details values(89,3,2233,'Veg Biriyani',1);

INSERT INTO Order_details values(91,4,2255,'Fish Biriyani',2);

SELECT * from Order_details;

select C_name from Customer join Order_details on Customer.C_id=Order_details.c_id where Order_details.Item_name='Chicken Biriyani';

select * from Customer join Order_details on Customer.C_id=Order_details.c_id where Order_details.Item_name='Chicken Biriyani';

select * from Customer natural join Order_details where Order_details.Item_name='Chicken Biriyani';

CREATE TABLE Staff ( 
  Staff_ID INT PRIMARY KEY, 
  R_id INT, 
  Name VARCHAR(25), 
  Position VARCHAR(25), 
  foreign key(R_id) references Restaurant(R_id) 
);

INSERT INTO Staff values(25,101,'Bhuvana','Manager');

INSERT INTO Staff values(52,101,'Renuka','Cashier');

INSERT INTO Staff values(67,101,'Manoj','Waiter');

CREATE TABLE Tables ( 
  Table_ID INT PRIMARY KEY, 
  staff_ID INT, 
  Table_Number INT, 
  Capacity INT, 
  Status VARCHAR(20), 
  foreign key(staff_ID) references staff(staff_ID) 
);

CREATE TABLE Table_status( 
  Table_ID INT PRIMARY KEY, 
  staff_ID INT, 
  Table_Number INT, 
  Capacity INT, 
  Status VARCHAR(20), 
  foreign key(staff_ID) references staff(staff_ID) 
);

INSERT INTO Table_status values(1,67,1,4,'Vacant');

INSERT INTO Table_status values(2,67,2,6,'Vacant');

INSERT INTO Table_status values(3,67,3,7,'Occupied');

CREATE TABLE Inventory ( 
  Inv_ID INT PRIMARY KEY, 
  Inv_Name VARCHAR(255), 
  Quantity INT, 
  Unit_Price DECIMAL(10, 2) 
);

CREATE TABLE Inventory_status( 
  Inv_ID INT PRIMARY KEY, 
  staff_ID INT, 
  Inv_Name VARCHAR(255), 
  Quantity INT, 
  Unit_Price DECIMAL(10, 2), 
  foreign key(staff_ID) references Staff(Staff_ID) 
);

INSERT INTO Order_dtls values(23,1,2233,'Veg Biriyani',239,2);

INSERT INTO Order_dtls values(23,1,2234,'Chicken Biriyani',289,1);

INSERT INTO Order_dtls values(56,2,2234,'Chicken Biriyani',289,2);

CREATE TABLE Order_dtls(  
  C_id int,  
  O_id int, 
  Item_id int, 
  Item_name varchar(30), 
  Unit_price DECIMAL(10,2), 
  Quantity int check(Quantity >0),  
  PRIMARY KEY (Item_id, O_id),  
  FOREIGN KEY (C_id) REFERENCES Customer(C_id),  
  FOREIGN KEY (O_id) REFERENCES Orders(O_id)  
);

INSERT INTO Order_dtls values(89,3,2244,'Prawns Biriyani',319,1);

INSERT INTO Order_dtls values(89,3,2233,'Veg Biriyani',239,1);

INSERT INTO Order_dtls values(91,4,2255,'Fish Biriyani',329,2);

INSERT INTO Inventory_status values(676,25,'Chicken Biriyani',6,289);

INSERT INTO Inventory_status values(125,25,'Veg Biriyani',10,239);

INSERT INTO Inventory_status values(677,25,'Prawn Biriyani',13,319);

INSERT INTO Inventory_status values(178,25,'Fish Biriyani',2,329);

select * from Inventory_status natural join Table_status;

select * from Inventory_status natural join staff;

SELECT * FROM Restaurant;

SELECT * FROM Table_status;

SELECT * FROM Table_status;

select * from order_dtls;

select * from Inventory_status;

