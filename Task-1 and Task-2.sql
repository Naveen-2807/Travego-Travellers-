-- TASK 1 and TASK 2 are answered in the same file simultaneously.

/* ####################################################
                   TASK 1
####################################################### */

-- QUESTION 1 : Creating the schema and required tables using MySQL workbench

# a. Create a schema named Travego and create the tables mentioned above with the mentioned
# column names. Also, declare the relevant datatypes for each feature/column in the dataset. (5 marks)

# Creating the Schema named Travego :

CREATE DATABASE Travego;

# Selecting Database for Creating the Tables :

USE Travego;

# Creating the 1st Table Named Passenger :

CREATE TABLE Passenger (
Passenger_Id INT
,Passenger_Name VARCHAR(20)
,Category VARCHAR(20)
,Gender VARCHAR(20)
,Boarding_City VARCHAR(20)
,Destination_City VARCHAR(20)
,Distance INT
,Bus_Type VARCHAR(20)
);

# Creating the 2nd Table Named Price :

CREATE TABLE Price (
Id INT 
,Bus_Type  VARCHAR(20)
,Distance INT
,Price INT 
);

# Cheching and Reviewing Tables

SHOW TABLES;

SELECT * FROM Passenger;
SELECT * FROM Price;

DESCRIBE Passenger;
DESCRIBE Price;
-- --------------------------------------------------------------------------------------------------------------------------------
# b. Insert the data in the newly created tables. (3 marks)
-- Insering on Passenger Table :

INSERT INTO Passenger (Passenger_Id,Passenger_Name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type)
VALUES (1, 'Sejal' ,'AC' ,'F', 'Bengaluru', 'Chennai' ,350 ,'Sleeper')
,(2, 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700 ,'Sitting')
,(3, 'Pallavi' ,'AC' ,'F', 'Panaji', 'Bengaluru' ,600 ,'Sleeper')
,(4 ,'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper')
,(5, 'Udit', 'Non-AC', 'M', 'Trivandrum' ,'Panaji' ,1000 ,'Sleeper')
,(6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting')
,(7 ,'Hemant', 'Non-AC', 'M','Panaji', 'Mumbai', 700 ,'Sleeper')
,(8, 'Manish', 'Non-AC' ,'M', 'Hyderabad' ,'Bengaluru' ,500, 'Sitting')
,(9 ,'Piyush', 'AC', 'M' ,'Pune' ,'Nagpur', 700 ,'Sitting');

-- Inserting on Price Table :

INSERT INTO Price (Id , Bus_Type , Distance , Price)
VALUES ( 1, 'Sleeper', 350 ,770)
,(2 ,'Sleeper', 500 ,1100)
,(3 ,'Sleeper', 600 ,1320)
,(4 ,'Sleeper', 700 ,1540)
,(5 ,'Sleeper', 1000, 2200)
,(6 ,'Sleeper', 1200 ,2640)
,(7, 'Sleeper', 1500 ,2700)
,(8, 'Sitting', 500, 620)
,(9 ,'Sitting', 600 ,744)
,(10 ,'Sitting', 700 ,868)
,(11, 'Sitting' ,1000, 1240)
,(12, 'Sitting' ,1200 ,1488)
,(13, 'Sitting' ,1500 ,1860);

# Retrieving the Records in the Table :

SELECT * FROM Passenger;
SELECT * FROM Price;

# COMMENT : There are Nine(9) rows in the table Passenger and
	     -- There are Thirteen(13) rows in the table Price .

/* #######################################################
                        TASK 2
########################################################## */

-- Question 2 : Perform read operation on the designed table created in the above task.

# a. How many female passengers traveled a minimum distance of 600 KMs? (1 mark)

SELECT COUNT(*) AS Female_Passengers FROM Passenger
WHERE Gender = 'F' AND Distance >= 600;

# Answer : Two(2) Female Passengers are Traveled Minimum of 600 KMs .

-- --------------------------------------------------------------------------------------------------------------------------------
# b. Write a query to display the passenger details whose travel distance is greater than 500 and
#   who are traveling in a sleeper bus. (2 marks)

SELECT * FROM Passenger
WHERE Distance > 500 AND Bus_Type = 'Sleeper' ;

# COMMENT : There are total of four(4) passengers who traveled greater than 500 Kms by traveling in slepper bus in the given data.

-- --------------------------------------------------------------------------------------------------------------------------------
# c. Select passenger names whose names start with the character 'S'.(2 marks)

SELECT * FROM Passenger
WHERE Passenger_Name LIKE 'S%';

# COMMENT : 'Sejal' is the only passenger whose name start with 'S' in the given data.

-- --------------------------------------------------------------------------------------------------------------------------------
# d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City,
# Destination City, Bus type, and Price in the output. (3 marks)

SELECT a.Passenger_Name , a.Boarding_City , a.Destination_City ,a.Bus_Type , b.Price
FROM Passenger a , Price b
WHERE a.Distance = b.Distance AND a.Bus_Type = b.Bus_Type;

# COMMENT : There are four(4) passengers who traveled sitting and five(5) passengers who traveled by slepper 
        -- total of nine(9) passengers and their datas like (Passenger name, Boarding City,Destination City, Bus type, and Price) are retrieved in the query.

-- --------------------------------------------------------------------------------------------------------------------------------
# e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus? (4 marks)

SELECT a.Passenger_Name , a.Distance , a.Bus_Type , b.Price 
FROM Passenger a , Price b
WHERE a.Distance = b.Distance AND a.Bus_Type = b.Bus_Type
AND a.Distance = 1000 AND a.Bus_Type = 'Sitting';

# Answer : No passenger is traveled 1000 KMs sitting in a bus.
# OBSERVATION : Considering the our human body taveling 1000 KMs sitting in a bus may give body pain , so least people may choose to travle 1000 KMs by sitting.
			--  But in the provided data no one is traveled by sitting for 1000 KMs.

-- --------------------------------------------------------------------------------------------------------------------------------
# f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji? (5marks)

SELECT a.Passenger_Name ,CONCAT_WS (' to ',a.Destination_City, a.Boarding_City) AS From_To , b.Bus_Type , b.Price 
FROM Passenger a , Price b
WHERE a.Distance = b.Distance AND b.Bus_Type IN ('Sleeper' , 'Sitting')
AND a.Passenger_Name = 'Pallavi';

# Answer : 1320 is the bus charge for Pallavi in Sleeper to travel from Bangalore to Panaji.
#          744 is the bus charge for Pallavi in Sitting to travel from Bangalore to Panaji.

-- --------------------------------------------------------------------------------------------------------------------------------
# g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper (2 marks)

UPDATE Passenger
SET Category = 'Non-AC'
WHERE Bus_Type = 'Sleeper';

-- After updation checking the records
SELECT * FROM Passenger
WHERE Bus_Type = 'Sleeper';

# COMMENT : All the category for Bus_Type 'Slepper' is changed(updated) to 'Non-AC'.

-- --------------------------------------------------------------------------------------------------------------------------------
# h. Delete an entry from the table where the passenger name is Piyush and commit this change in the database. (1 mark)

START TRANSACTION;
DELETE FROM Passenger WHERE Passenger_Name = 'Piyush';
COMMIT;

-- Checking whether the record is deleted or not.
SELECT * FROM Passenger WHERE Passenger_Name = 'Piyush';

# COMMENT : The record where the Passenger_Name 'Piyush' is permenantly deleted from the Passenger table.

-- --------------------------------------------------------------------------------------------------------------------------------
# i. Truncate the table passenger and comment on the number of rows in the table (explain if required). (1 mark)

TRUNCATE TABLE Passenger;

-- After Truncating checking the table
SELECT * FROM Passenger;

# EXPLANATION : There are Zero(0) rows in the table Passenger.
		     #  Beacuse truncating is the method of deleting all the records in the table without affecting the table structure
             #  So , the records in the table is deleted but the table structure is not dropped.
-- --------------------------------------------------------------------------------------------------------------------------------
# j. Delete the table passenger from the database. (1 mark)

DROP TABLE Passenger;

-- After Dropping checking if the table exists or not
SHOW TABLES LIKE '%Passenger%';

# COMMENT : The table is permenantly deleted from the Database.