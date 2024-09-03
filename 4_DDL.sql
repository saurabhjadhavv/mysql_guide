-- DDL - Data Definition Language 

-- ---------------------------------------1. CREATE – Creates New Objects-------------------------------------------------------
-- CREATE Queries

-- Create a new table for storing product reviews:
CREATE TABLE ProductReviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    ReviewText TEXT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Create a new table to store product categories:
CREATE TABLE ProductCategories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE NOT NULL
);
-- Create a new table for storing shipping information:
CREATE TABLE ShippingInfo (
    ShippingID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ShippingAddress TEXT,
    ShippingDate TIMESTAMP,
    DeliveryDate TIMESTAMP,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
-- Create a new table to log user activity:
CREATE TABLE UserActivity (
    ActivityID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    ActivityType VARCHAR(50),
    ActivityDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- ------------------------------------------------- ALTER Queries-----------------------------------------------------------------
-- Add a new column Discount to the Products table:
ALTER TABLE Products
ADD Discount DECIMAL(5, 2) DEFAULT 0.00;

-- Change the data type of Phone column in Customers table to VARCHAR(30):
ALTER TABLE Customers
MODIFY Phone VARCHAR(30);    ------ it will not work in online lite mode
 
 

-- Rename the Description column in the Products table to ProductDescription:
ALTER TABLE Products
RENAME COLUMN Description TO ProductDescription;

-- Set the default value of StockQuantity in the Products table to 10:
ALTER TABLE Products
ALTER COLUMN StockQuantity SET DEFAULT 10; --- This will also not work in online mode
 

-- ---------------------------------------------------DROP Queries---------------------------------------------------------------
-- Drop the ProductReviews table:
DROP TABLE ProductReviews;

-- Drop the ShippingInfo table:
DROP TABLE ShippingInfo;

-- Drop the ProductCategories table:
DROP TABLE ProductCategories;

-- Drop the UserActivity table:
DROP TABLE UserActivity;

-- ----------------------------------------------------- TRUNCATE Queries---------------------------------------------------
-- Truncate the OrderItems table (removes all rows but keeps the table structure):
TRUNCATE TABLE OrderItems;
 
 
-- While using Mysql workbench, if the tables are dependent then remove the connection first
-- SET foreign_key_checks = 0; To diasable 
-- SET foreign_key_checks = 1; -- to add back

-- Truncate the Orders table:
TRUNCATE TABLE Orders; --- for mysql -- it will trow error cause it is dependent

SET foreign_key_checks = 0;-- first run this then trcuncate 
-- and then again run this to build connection
SET foreign_key_checks = 1;


--  --------------------------------------------RENAME Queries---------------------------------------
-- Rename the Products table to ProductCatalog:
ALTER TABLE Products
RENAME TO ProductCatalog;

RENAME TABLE ProductCatalog to Products; -- Without giving alter comamnd
 
-- Rename the OrderItems table to OrderDetails:
RENAME TABLE OrderItems TO OrderDetails;

-- Rename the Customers table to Clients:
RENAME TABLE Customers TO Clients;

-- Rename the Orders table to CustomerOrders:
RENAME TABLE Orders TO CustomerOrders;

