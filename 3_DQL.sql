-- DQL-Data Query Language 

-- SELECT Queries
-- List all products with their names and prices:
SELECT ProductName, Price
FROM Products;

-- Retrieve the order dates and statuses for all orders:
SELECT OrderDate, Status
FROM Orders;

-- Get all customer phone numbers and their email addresses:
SELECT Phone, Email
FROM Customers;

-- To get Unique values use distinct
-- DISTINCT Queries
-- Find all unique product categories:
SELECT DISTINCT Category
FROM Products;

-- List all unique customer email addresses:
SELECT DISTINCT Email
FROM Customers;

-- Retrieve all distinct statuses from the Orders table:
SELECT DISTINCT Status
FROM Orders;

-- DQL-Data Query Language 