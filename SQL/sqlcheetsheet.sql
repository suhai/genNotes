STRUCTURED QUERY LANGUAGE
-- SELECT - extracts data from a database
-- UPDATE - updates data in a database
-- DELETE - deletes data from a database
-- INSERT INTO - inserts new data into a database
-- CREATE DATABASE - creates a new database
-- ALTER DATABASE - modifies a database
-- CREATE TABLE - creates a new table
-- ALTER TABLE - modifies a table
-- DROP TABLE - deletes a table
-- CREATE INDEX - creates an index (search key)
-- DROP INDEX - deletes an index

-- Ex.1 SELECT DISTINCT
SELECT DISTINCT column1, column2, ...
FROM table_name;

SELECT DISTINCT Country FROM Customers;  -- selects only the DISTINCT values from the "Country" column in the "Customers" table

-- Ex.2 COUNT
SELECT COUNT(DISTINCT Country) FROM Customers; -- (will not work in Firefox)

SELECT Count(*) AS DistinctCountries
FROM (SELECT DISTINCT Country FROM Customers);  -- (will work in all browsers)lists the number of different (distinct) customer countries

-- Ex.3  WHERE
SELECT * FROM Customers
WHERE Country='Mexico'; -- selects all the customers from the country "Mexico", in the "Customers" table
SELECT * FROM Customers
WHERE CustomerID = 1;

-- Ex.4  AND OR NOT
SELECT * FROM Customers
WHERE City='Berlin' OR City='München';

SELECT * FROM Customers
WHERE NOT Country='Germany';

SELECT * FROM Customers
WHERE Country='Germany' AND (City='Berlin' OR City='München');

SELECT * FROM Customers
WHERE NOT Country='Germany' AND NOT Country='USA';

-- Ex.5 ORDER BY
SELECT * FROM Customers
ORDER BY Country;

SELECT * FROM Customers
ORDER BY Country DESC;

SELECT * FROM Customers
ORDER BY Country, CustomerName;

SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;


-- Ex.6 INSERT INTO
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');

-- Ex.7 NULL VALUES
SELECT LastName, FirstName, Address FROM Persons
WHERE Address IS NULL;

SELECT LastName, FirstName, Address FROM Persons
WHERE Address IS NOT NULL;

-- Ex.7 UPDATE
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;

UPDATE Customers
SET ContactName='Juan'
WHERE Country='Mexico'; -- It is the WHERE clause that determines how many records that will be updated. the above statement will update the contactname to "Juan" for all records where country is "Mexico". Be careful when updating records. If you omit the WHERE clause, ALL records will be updated!

-- Ex.8 DELETE
DELETE FROM table_name
WHERE condition;

DELETE FROM Customers
WHERE CustomerName='Alfreds Futterkiste';

-- It is possible to delete all rows in a table without deleting the table. This means that the table structure, attributes, and indexes will be intact:
DELETE FROM table_name;
-- or
DELETE * FROM table_name;

-- Ex.9 LIMIT
SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number;

SELECT * FROM Customers
LIMIT 3;

SELECT * FROM Customers
WHERE Country='Germany'
LIMIT 3;

-- Ex.10 MIN MAX
SELECT MIN(column_name)
FROM table_name
WHERE condition;

SELECT MIN(Price) AS SmallestPrice
FROM Products;

-- Ex.11 COUNT AVERAGE SUM
SELECT COUNT(ProductID)
FROM Products;

SELECT AVG(Price)
FROM Products;

SELECT SUM(Quantity)
FROM OrderDetails;

-- Ex.12 LIKE
SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;

SELECT * FROM Customers
WHERE CustomerName LIKE 'a%'; -- selects all customers with a CustomerName starting with "a"

SELECT * FROM Customers
WHERE CustomerName LIKE '%a'; -- selects all customers with a CustomerName ending with "a"

SELECT * FROM Customers
WHERE CustomerName LIKE '%or%'; -- selects all customers with a CustomerName that have "or" in any position

SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';

SELECT * FROM Customers
WHERE CustomerName LIKE '_r%'; -- selects all customers with a CustomerName that have "r" in the second position

SELECT * FROM Customers
WHERE CustomerName LIKE 'a_%_%'; -- selects all customers with a CustomerName that starts with "a" and are at least 3 characters in length

SELECT * FROM Customers
WHERE ContactName LIKE 'a%o'; -- selects all customers with a CustomerName that starts with "a" and ends with "o"

SELECT * FROM Customers
WHERE CustomerName NOT LIKE 'a%'; --  selects all customers with a CustomerName that NOT starts with "a"


-- Ex.13 LIKE
SELECT * FROM Customers
WHERE City LIKE 'ber%'; -- selects all customers with a City starting with "ber"

SELECT * FROM Customers
WHERE City LIKE '%es%'; -- selects all customers with a City containing the pattern "es"

SELECT * FROM Customers
WHERE City LIKE '_erlin'; -- selects all customers with a City starting with any character, followed by "erlin"

SELECT * FROM Customers
WHERE City LIKE 'L_n_on'; -- selects all customers with a City starting with "L", followed by any character, followed by "n", followed by any character, followed by "on"

SELECT * FROM Customers
WHERE City LIKE '[bsp]%'; -- selects all customers with a City starting with "b", "s", or "p"

SELECT * FROM Customers
WHERE City LIKE '[a-c]%'; -- selects all customers with a City starting with "a", "b", or "c"

SELECT * FROM Customers
WHERE City LIKE '[!bsp]%'; -- selects all customers with a City NOT starting with "b", "s", or "p" . The above is equivalent to the below code.
SELECT * FROM Customers
WHERE City NOT LIKE '[bsp]%';

-- Ex.14 IN 
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);

SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK'); -- selects all customers that are located in "Germany", "France" and "UK"

SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK'); -- selects all customers that are NOT located in "Germany", "France" or "UK"

SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers); -- selects all customers that are from the same countries as the suppliers

-- Ex.15 BETWEEN
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20; -- selects all products with a price BETWEEN 10 and 20

SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20; -- To display the products outside the range of the previous example.

SELECT * FROM Products
WHERE (Price BETWEEN 10 AND 20)
AND NOT CategoryID IN (1,2,3); -- selects all products with a price BETWEEN 10 and 20. In addition; do not show products with a CategoryID of 1,2, or 3

SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName; -- selects all products with a ProductName BETWEEN 'Carnarvon Tigers' and 'Mozzarella di Giovanni'

SELECT * FROM Products
WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName; -- selects all products with a ProductName NOT BETWEEN 'Carnarvon Tigers' and 'Mozzarella di Giovanni'

SELECT * FROM Orders
WHERE OrderDate BETWEEN #07/04/1996# AND #07/09/1996#; -- selects all orders with an OrderDate BETWEEN '04-July-1996' and '09-July-1996'
 

-- Ex.16 ALIASES
SELECT column_name AS alias_name
FROM table_name;

SELECT column_name(s)
FROM table_name AS alias_name;

SELECT CustomerID as ID, CustomerName AS Customer
FROM Customers; -- creates two aliases, one for the CustomerID column and one for the CustomerName column

SELECT CustomerName AS Customer, ContactName AS [Contact Person]
FROM Customers; -- creates two aliases, one for the CustomerName column and one for the ContactName column. Note: It requires double quotation marks or square brackets if the alias name contains spaces

SELECT CustomerName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address
FROM Customers; -- creates an alias named "Address" that combine four columns (Address, PostalCode, City and Country). The above is equivalent to :
SELECT CustomerName, CONCAT(Address,', ',PostalCode,', ',City,', ',Country) AS Address
FROM Customers;

SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName="Around the Horn" AND c.CustomerID=o.CustomerID; -- selects all the orders from the customer with CustomerID=4 (Around the Horn). We use the "Customers" and "Orders" tables, and give them the table aliases of "c" and "o" respectively (Here we use aliases to make the SQL shorter). The above code is equivalent to :
SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName
FROM Customers, Orders
WHERE Customers.CustomerName="Around the Horn" AND Customers.CustomerID=Orders.CustomerID;

-- Ex.17 INNER JOIN
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID; -- selects records that have matching values in both tables

SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID); -- selects all orders with customer and shipper information


-- Ex.18 LEFT JOIN
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName; -- will select all customers, and any orders they might have


-- Ex.19 RIGHT JOIN
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID; -- return all employees, and any orders they might have have placed


-- Ex.20 FULL OUTER JOIN
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName; -- selects all customers, and all orders

-- Ex.21 UNION
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City; -- selects all the different cities (only distinct values) from "Customers" and "Suppliers"

SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City; -- selects all cities (duplicate values also) from "Customers" and "Suppliers"

SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City; -- selects all the different German cities (only distinct values) from "Customers" and "Suppliers"

SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION ALL
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City; -- selects all German cities (duplicate values also) from "Customers" and "Suppliers"

SELECT 'Customer' As Type, ContactName, City, Country
FROM Customers
UNION
SELECT 'Supplier', ContactName, City, Country
FROM Suppliers; -- lists all customers and suppliers

-- Ex.22 GROUP BY
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country; -- lists the number of customers in each country

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC; -- lists the number of customers in each country, sorted high to low

SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName; -- lists the number of orders sent by each shipper

-- Ex.23 HAVING
-- The HAVING clause was added to SQL because the WHERE keyword could not be used with aggregate functions.
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5; -- lists the number of customers in each country. Only include countries with more than 5 customers

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC; -- lists the number of customers in each country, sorted high to low (Only include countries with more than 5 customers)

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM (Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10; -- lists the employees that have registered more than 10 orders

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25; -- lists if the employees "Davolio" or "Fuller" have registered more than 25 orders


-- Ex.24 EXISTS
SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);

SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE SupplierId = Suppliers.supplierId AND Price < 20); -- returns TRUE and lists the suppliers with a product price less than 20

SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE SupplierId = Suppliers.supplierId AND Price = 22); -- returns TRUE and lists the suppliers with a product price equal to 22

-- Ex.25 ANY / ALL
-- The ANY and ALL operators are used with a WHERE or HAVING clause.
-- The ANY operator returns true if any of the subquery values meet the condition.
-- The ALL operator returns true if all of the subquery values meet the condition.
SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
(SELECT column_name FROM table_name WHERE condition);

SELECT column_name(s)
FROM table_name
WHERE column_name operator ALL
(SELECT column_name FROM table_name WHERE condition);

SELECT ProductName
FROM Products
WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails WHERE Quantity = 10); -- returns TRUE and lists the productnames if it finds ANY records in the OrderDetails table that quantity = 10

SELECT ProductName
FROM Products
WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails WHERE Quantity > 99); -- returns TRUE and lists the productnames if it finds ANY records in the OrderDetails table that quantity > 99

SELECT ProductName
FROM Products
WHERE ProductID = ALL (SELECT ProductID FROM OrderDetails WHERE Quantity = 10); -- returns TRUE and lists the productnames if ALL the records in the OrderDetails table has quantity = 10

-- Ex.26 SELECT INTO
SELECT *
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;

SELECT * INTO CustomersBackup2017
FROM Customers; -- creates a backup copy of Customers

SELECT * INTO CustomersBackup2017 IN 'Backup.mdb'
FROM Customers; -- uses the IN clause to copy the table into a new table in another database

SELECT CustomerName, ContactName INTO CustomersBackup2017
FROM Customers; -- copies only a few columns into a new table

SELECT * INTO CustomersGermany
FROM Customers
WHERE Country = 'Germany'; -- copies only the German customers into a new table

SELECT Customers.CustomerName, Orders.OrderID
INTO CustomersOrderBackup2017
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID; -- copies data from more than one table into a new table

SELECT * INTO newtable
FROM oldtable
WHERE 1 = 0; -- used to create a new, empty table using the schema of another. Just add a WHERE clause that causes the query to return no data.


-- Ex.27 INSERT INTO SELECT
-- Copy all columns from one table to another table
INSERT INTO table2
SELECT * FROM table1
WHERE condition;

-- Copy only some columns from one table into another table
INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition;

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers; -- copies "Suppliers" into "Customers" (the columns that are not filled with data, will contain NULL)

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT SupplierName, ContactName, Address, City, PostalCode, Country FROM Suppliers; -- copies "Suppliers" into "Customers" (fill all columns)

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country='Germany'; -- copies only the German suppliers into "Customers"

-- Ex.28 CREATE  or DROP DATABASE
CREATE DATABASE databasename;
DROP DATABASE databasename;

-- Ex.29 CREATE or DROP TABLE
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255) 
);

CREATE TABLE new_table_name AS
    SELECT column1, column2,...
    FROM existing_table_name
    WHERE ....; -- create a new table using an existing table, the new table will be filled with the existing values from the old table


DROP TABLE table_name; -- deletes an entire table

TRUNCATE TABLE table_name; -- The TRUNCATE TABLE statement is used to delete the data inside a table, but not the table itself

-- Ex.30 ALTER TABLE - ADD Column
ALTER TABLE table_name
ADD column_name datatype;

ALTER TABLE Persons
ADD DateOfBirth date; -- add a column named "DateOfBirth" in the "Persons" table

-- Ex.31 ALTER TABLE - ALTER/MODIFY COLUMN
ALTER TABLE table_name
ALTER COLUMN column_name datatype;

ALTER TABLE Persons
ALTER COLUMN DateOfBirth year; -- change the data type of the column named "DateOfBirth" in the "Persons" table

-- Ex.32 ALTER TABLE - DROP COLUMN
ALTER TABLE table_name
DROP COLUMN column_name;

ALTER TABLE Persons
DROP COLUMN DateOfBirth; -- delete the column named "DateOfBirth" in the "Persons" table

-- Ex.33 CONSTRAINTS 
CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    column3 datatype constraint,
    ....
);
/* The following constraints are commonly used in SQL:
NOT NULL - Ensures that a column cannot have a NULL value
UNIQUE - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Uniquely identifies a row/record in another table
CHECK - Ensures that all values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column when no value is specified
INDEX - Use to create and retrieve data from the database very quickly */

-- Ex.34 NOT NULL
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
); -- ensures that the "ID", "LastName", and "FirstName" columns will NOT accept NULL values

-- Ex.35 UNIQUE
CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
); -- nameS a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns, use the following SQL syntax

ALTER TABLE Persons
ADD UNIQUE (ID); -- createS a UNIQUE constraint on the "ID" column when the table is already created, use the following SQL

ALTER TABLE Persons
DROP CONSTRAINT UC_Person; -- drops a UNIQUE constraint, use the following SQL

-- Ex.36 FOREIGN KEY
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
); 
-- OR
CREATE TABLE Orders (
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);

ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID); -- create a FOREIGN KEY constraint on the "PersonID" column when the "Orders" table is already created, use the following SQL

ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder; -- drop a FOREIGN KEY constraint, use the following SQL

-- Ex.37  CHECK
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
); 
-- OR
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (Age>=18)
);-- creates a CHECK constraint on the "Age" column when the "Persons" table is created. The CHECK constraint ensures that you can not have any person below 18 years

ALTER TABLE Persons
ADD CHECK (Age>=18); -- create a CHECK constraint on the "Age" column when the table is already created, use the following SQL

ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge; -- drops a CHECK constraint on the "Age" column when the table is already created, use the following SQL

-- Ex.38  DEFAULT
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
); -- sets a DEFAULT value for the "City" column when the "Persons" table is created

CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT GETDATE()
); -- The DEFAULT constraint can also be used to insert system values, by using functions like GETDATE()

ALTER TABLE Persons
ALTER City SET DEFAULT 'Sandnes'; -- create a DEFAULT constraint on the "City" column when the table is already createD

ALTER TABLE Persons
ALTER City DROP DEFAULT; -- dropS a DEFAULT constraint

-- Ex.39 CREATE INDEX
-- The CREATE INDEX statement is used to create indexes in tables.
-- Indexes are used to retrieve data from the database very fast. The users cannot see the indexes, they are just used to speed up searches/queries.
-- Note: Updating a table with indexes takes more time than updating a table without (because the indexes also need an update). So, only create indexes on columns that will be frequently searched against.
CREATE INDEX index_name
ON table_name (column1, column2, ...); -- Creates an index on a table. Duplicate values are allowed

CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...); -- Creates a unique index on a table. Duplicate values are not allowed

CREATE INDEX idx_lastname
ON Persons (LastName); -- creates an index named "idx_lastname" on the "LastName" column in the "Persons" table

CREATE INDEX idx_pname
ON Persons (LastName, FirstName); -- create an index on a combination of columns, you can list the column names within the parentheses, separated by commas

-- Ex.40 DROP INDEX
DROP INDEX index_name ON table_name; -- to delete an index in a table


-- https://community.modeanalytics.com/sql/tutorial/introduction-to-sql/
-- STRUCTURED QUERY LANGUAGE
1. Think of INNER JOIN as the set intersection of a venn diagram
2. Think of OUTER JOIN
  - LEFT OUTER JOIN as similar to the entire left circle of the venn diagram including the intersection of the left and right circles. This makes use of foreign keys
  - RIGHT OUTER JOIN as simialr to the entire right circle of the venn diagram including the intersection of the left and right circles. This makes use of foreign keys
  - FULL OUTER JOIN as the union of the two circles including the intersection, that makes use of foreign keys.


-- SELECT
-- FROM
-- WHERE
-- COUNT 
-- SUM
-- IN (a group or list to filter)
-- NOT IN
-- JOIN 
-- AS 
-- ON 
-- IS 
-- BETWEEN (A-inclusive AND B-exclusive)
-- NULL 
-- NOT NULL 
-- ORDER BY 
-- GROUP BY 
-- DESC 
-- ASC 
-- =, !=, >, >=, <, <= 



SOME EXAMPLES OF QUERYING
-- 1. In a car database there is a Model table with columns, ModelID, MakeID and ModelName and a Car table with columns, CarID, ModelID, VIN, ModelYear and StickerPrice.
-- For all cars in the database, show Model Name, VIN and Sticker Price from the Model and Car tables in one result set.
SELECT ModelName, VIN, StickerPrice 
FROM model 
INNER JOIN car ON model.ModelID = car.ModelID;

-- 2. In a car database there is a Make table with columns, MakeID and MakeName, a Model table with columns, ModelID, MakeID and ModelName and a Car table with columns, CarID, ModelID, VIN, ModelYear and StickerPrice.
-- For all cars in the database, show Make Name, Model Name, VIN and Sticker Price from the Model and Car tables in one result set.
SELECT MakeName, ModelName, VIN, StickerPrice 
FROM make 
INNER JOIN model ON make.MakeID = model.MakeID 
INNER JOIN car ON model.ModelID = car.ModelID;

-- 3. In a car database there is a Model table with columns, ModelID, MakeID and ModelName and a Car table with columns, CarID, ModelID, VIN, ModelYear and StickerPrice.
-- Show all Model names from the Model table along with VIN from the Car table. Make sure models that aren’t in the Car table still show in the results!
SELECT ModelName, VIN 
FROM model 
LEFT OUTER JOIN car ON car.ModelID = model.ModelID;

-- 4. In a car database there is a Sale table with columns, SaleID, CarID, CustomerID, LocationID, SalesRepID, SaleAmount and SaleDate. The database also has a SalesRep table with columns, SalesRepID, FirstName, LastName, SSN, PhoneNumber, StreetAddress, City, State and ZipCode.
-- Show all SaleDate, SaleAmount, and SalesRep First and Last name from Sale and SalesRep. Make sure that all Sales appear in results even if there is no SalesRep associated to the sale.
SELECT sale.SaleDate, sale.SaleAmount, salesRep.firstName, salesRep.lastName FROM sale 
LEFT OUTER JOIN salesrep ON sale.SalesRepID = salesrep.SalesRepID;

-- 5. There are two tables Fruit and Vegetable table. The Fruit table has a FruitID and a Name column and the Vegetable table has a VegetableID and Name column.
-- Create a distinct result set of fruit and vegetable names.
SELECT fruit.Name 
FROM fruit 
UNION SELECT vegetable.Name FROM vegetable;

-- 6. There are two tables Fruit and Vegetable table. The Fruit table has a FruitID and a Name column and the Vegetable table has a VegetableID and Name column.
-- Create a list of all fruits and vegetables starting with the letters A through K . In other words all fruit and vegetables that don't start with the letter L to Z.
SELECT fruit.Name 
FROM fruit 
WHERE fruit.Name BETWEEN "A" AND "L" 
UNION 
SELECT vegetable.Name FROM vegetable WHERE vegetable.Name BETWEEN "A" AND "L";

-- 7. There are two tables Fruit and Vegetable table. The Fruit table has a FruitID and a Name column and the Vegetable table has a VegetableID and Name column.
-- Create a list of fruits and vegetables that includes any potential duplicate values. Ensure that it is in alphabetical order so that the duplicates are next to each other!
SELECT fruit.Name 
FROM fruit 
UNION ALL SELECT vegetable.Name FROM vegetable ORDER BY Name ASC;

-- 8. There are two tables Fruit and Vegetable table. The Fruit table has a FruitID and a Name column and the Vegetable table has a VegetableID and Name column.
-- Create an alphabetical list of produce that is considered both a fruit and a vegetable.
SELECT name 
FROM fruit 
INTERSECT SELECT name FROM vegetable ORDER BY name ASC;

-- 9. There are two tables Fruit and Vegetable table. The Fruit table has a FruitID and a Name column and the Vegetable table has a VegetableID and Name column.
-- Create an alphabetical list of fruits that are NOT considered a vegetable.
SELECT name 
FROM fruit 
EXCEPT SELECT name FROM vegetable ORDER BY name ASC;

-- 10. There are two tables Fruit and Vegetable table. The Fruit table has a FruitID and a Name column and the Vegetable table has a VegetableID and Name column.
-- Create an alphabetical list of vegetables that are NOT considered a fruit.
SELECT name 
FROM vegetable 
EXCEPT SELECT name FROM fruit ORDER BY name ASC;

-- 11. In a car database there is a Model table with columns, ModelID, MakeID and ModelName and a Car table with columns, CarID, ModelID, VIN, ModelYear and StickerPrice.
-- Use a subquery along with IN to list all the Model Names with a Sticker Price greater than $30000
SELECT ModelName 
FROM Model 
WHERE ModelID IN ( SELECT ModelID FROM Car WHERE StickerPrice > 30000 );

-- 12. In a car database there is a Sale table with columns, SaleID, CarID, CustomerID, LocationID, SalesRepID, SaleAmount and SaleDate and a Car table with columns, CarID, ModelID, VIN, ModelYear and StickerPrice.
-- Use a subquery along with IN to list all sales of cars with Sticker Price greater than $30000. Include all columns.
SELECT * 
FROM Sale 
WHERE CarID IN ( SELECT CarID FROM Car WHERE StickerPrice > 30000 );

-- 13. In a car database there is a Sale table with columns, SaleID, CarID, CustomerID, LocationID, SalesRepID, SaleAmount and SaleDate and a Customer table with columns, CustomerID, FirstName, LastName, Gender and SSN.
-- Use a subquery along with IN to list all sales to female customers. (Gender = 'F') Select all columns.
SELECT * 
FROM sale 
WHERE sale.CustomerID IN (SELECT CustomerID FROM customer WHERE customer.Gender = 'F');


-- 14. In a car database there is a Sale table with columns, SaleID, CarID, CustomerID, LocationID, SalesRepID, SaleAmount and SaleDate and a Customer table with columns, CustomerID, FirstName, LastName, Gender and SSN.
-- Use a subquery as a derived table to show all sales to female ('F') customers. Select all columns from the Sale table only.
SELECT * FROM Sale AS s 
INNER JOIN (
  SELECT CustomerID FROM Customer
  WHERE Gender = 'F'
) AS c 
ON s.CustomerID = c.CustomerID;






-- Querying Relational Databases Cheatsheet
-- SQL JOINs

-- JOINs merge related data from multiple tables together in to result set.
-- The two most common types of joins are:
-- INNER JOIN
-- OUTER JOIN
-- INNER JOINs

-- INNER JOINs return rows that match from both tables.
SELECT <columns> FROM <table 1> 
  INNER JOIN <table 2> ON <table 1>.<column> = <table 2>.<column>;

SELECT <columns> FROM <table 1> AS <table 1 alias> 
  INNER JOIN <table 2> AS <table 2 alias> ON <table 1 alias>.<column> = <table 2 alias>.<column>;

-- Examples:
SELECT product_name, category FROM products
  INNER JOIN product_categories ON products.category_id = product_categories.id;

SELECT products.product_name, product_categories.category FROM products
  INNER JOIN product_categories ON products.category_id = product_categories.id;

SELECT p.product_name, c.category FROM products AS p
  INNER JOIN product_categories AS c ON p.category_id = c.id;  

-- INNER JOINing multiple tables:
SELECT <columns> FROM <table 1> 
  INNER JOIN <table 2> ON <table 1>.<column> = <table 2>.<column>
  INNER JOIN <table 3> ON <table 1>.<column> = <table 3>.<column>;

-- Examples:
SELECT users.full_name, sales.amount, products.name FROM sales 
  INNER JOIN users ON sales.user_id = users.id
  INNER JOIN products ON sales.product_id = products.id;


-- OUTER JOINs
-- There are 3 types of OUTER JOINs:
-- LEFT OUTER JOIN - JOINs all matching data and all non-matching rows from the left table in the query

-- RIGHT OUTER JOIN - JOINs all matching data and all non-matching rows from the right table in the query

-- FULL OUTER JOIN - JOINs all matching data and then all non-matching rows from both tables.


SELECT <columns> FROM <left table> 
  LEFT OUTER JOIN <right right> ON <left table>.<column> = <right table>.<column>;

SELECT <columns> FROM <left table> AS <left alias> 
  LEFT OUTER JOIN <right table> AS <right alias> 
  ON <left alias>.<column> = <right alias>.<column>;

-- Example
-- If you wanted to get the product count for every category, even categories without products, an OUTER JOIN is the best solution. The following two examples will yield the same results, however one is an

SELECT categories.name, COUNT(products.id) AS "Product Count" FROM categories
  LEFT OUTER JOIN products ON categories.id = products.category_id;

SELECT categories.name, COUNT(products.id) AS "Products Count" FROM products
  RIGHT OUTER JOIN categories ON categories.id = products.category_id;



-- Set Operations
-- Set operations merge data in to one set based on column definitions and the data contained within each column.
-- The four set operations are:
-- UNION
-- UNION ALL
-- INTERSECT
-- EXCEPT

-- The number of columns need to match. If number of columns don't match it'll result in an error.
-- <query 1> <set operation> <query 2>
SELECT <column> FROM <table 1> <set operation> SELECT <column> FROM <table 2>;
SELECT <column>, <column> FROM <table 1> <set operation> SELECT <column>, <column> FROM <table 2>;

-- UNION Examples
-- Unions return all distinct values from both data sets with no duplicates.
-- Get a list of unique restaurants from both north and south malls.
SELECT store FROM mall_south WHERE type = "restaurant"
  UNION 
SELECT store FROM mall_north WHERE type = "restaurant";

-- Get a list of unique classes taught in two schools. Order them by their class name.
SELECT evening_class FROM school_1 UNION SELECT evening_class FROM school_2
  ORDER BY evening_class ASC;


-- UNION ALL
-- Union all returns all values from both data sets – with duplicates.
-- Get a list of all names for boys and girls and order them by name.
SELECT boy_name AS name FROM boy_baby_names 
  UNION ALL 
SELECT girl_name AS name FROM girl_baby_names
  ORDER by name;


-- INTERSECT
-- Returns only values that are in both data sets.
-- Get list of classes offered in both schools.
SELECT evening_class FROM school_1 INTERSECT SELECT evening_class FROM school_2
  ORDER BY evening_class ASC;

-- Get list of restaurants at both mall locations.
SELECT store FROM mall_south WHERE type = "restaurant"
  INTERSECT 
SELECT store FROM mall_north WHERE type = "restaurant";


-- EXCEPT
-- Returns data from the first data set that's not in the second.
-- Get a list of local stores in a mall.
SELECT store FROM mall
  EXCEPT
SELECT store FROM all_stores WHERE type = "national"


-- Subqueries
-- Subqueries are queries within queries. A subquery can also be called an inner query with the "parent" query being called the outer query.
-- There are two main ways to use a subquery:
-- In an IN condition
-- As a derived or temporary table
-- A subquery in an IN condition must only have one column.

SELECT <columns> FROM <table 1> WHERE <table 1>.<column> IN (<subquery>);
SELECT <columns> FROM <table 1> 
  WHERE <table 1>.<column> IN (SELECT <a single column> FROM <table 2> WHERE <condition>);
-- Examples:
-- Get a list of user's names and emails for users who have spent over 100 dollars in a single transaction.
SELECT name, email FROM users 
  WHERE id IN (SELECT DISTINCT(user_id) FROM sales WHERE saleAmount > 100);
-- // OR
SELECT name, email FROM users
  INNER JOIN (SELECT DISTINCT(user_id) FROM sales WHERE saleAmount > 100) AS best_customers
  ON users.id = best_customers.user_id;

-- Get a list of user's names and emails for users who have spent over 1000 dollars in total.
SELECT name, email FROM users WHERE id IN (SELECT user_id FROM sales WHERE SUM(saleAmount) > 1000 GROUP BY user_id);
-- // OR
SELECT name, email, total FROM users 
  INNER JOIN (SELECT user_id, SUM(saleAmount) AS total FROM sales WHERE total > 1000 GROUP BY user_id) AS ultimate_customers
  ON users.id = ultimate_customers.user_id;