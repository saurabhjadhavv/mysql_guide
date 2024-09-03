-- DML - Data Manipulation Language 

-- ------------------------------------------- UPDATE Examples----------------------------------------------
-- Update a customer’s phone number:
UPDATE Customers
SET Phone = '555-9999'
WHERE CustomerID = 1;

-- Change the status of an order to 'Delivered':
UPDATE Orders
SET Status = 'Delivered'
WHERE OrderID = 2;

-- ----------------------------------------INSERT Examples-------------------------------------------------------------------
-- Insert a new customer into the Customers table:
INSERT INTO Customers (FirstName, LastName, Email, Phone, RegistrationDate)
VALUES ('Alice', 'Johnson', 'alice.johnson@example.com', '555-2020', '2024-08-30');

-- Add a new product to the Products table:
INSERT INTO Products (ProductName, Description, Price, StockQuantity, Category)
VALUES ('Wireless Mouse', 'Ergonomic wireless mouse with adjustable DPI', 29.99, 150, 'Accessories');

-- Insert a new order into the Orders table:
INSERT INTO Orders (CustomerID, OrderDate, Status)
VALUES (3, '2024-08-30', 'Pending');

-- -----------------------------------------------DELETE Examples-----------------------------------------------------------------
-- Delete a specific customer from the Customers table:
DELETE FROM Customers
WHERE CustomerID = 5;

-- Remove all products in the 'Furniture' category:
DELETE FROM Products
WHERE Category = 'Furniture'; -- throw error so againdiabsle the relation

-- Disable foreign key checks
SET foreign_key_checks = 0;

-- Perform the delete operation
-- and then 
-- Re-enable foreign key checks
SET foreign_key_checks = 1;





-- Delete all orders with the status 'Cancelled':
DELETE FROM Orders
WHERE Status = 'Cancelled'; -- Do the same disbale and then enable, SET foreign_key_checks = 0; SET foreign_key_checks = 1;


