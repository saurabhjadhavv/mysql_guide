-- TCL - Transaction Control Language 

-- -----------------Fisrt simple transcation with commit----------------------------------------------------------------------
-- Start a new transaction
START TRANSACTION;

-- Perform some update operations
UPDATE Products
SET Price = 1539
WHERE Category = 'Electronics';

-- Check the updated data (optional, for verification)
SELECT * FROM Products WHERE Category = 'Electronics';

-- Commit the transaction to save changes
COMMIT;

 -- -----------------Fisrt simple transcation with Rollback -------------------------------------------------------
 
 
 START TRANSACTION;

-- Perform some update operations
UPDATE Products
SET Price = 1555
WHERE Category = 'Electronics';

-- Check the updated data (optional, for verification)
SELECT * FROM Products WHERE Category = 'Electronics';

-- Commit the transaction to save changes
rollback;

-- ------------------------------- With SavePoint--------------------------------------------------

-- 1. Start a new transaction
START TRANSACTION;

-- 2. Perform some initial update operation
UPDATE Products
SET Price = 1512
WHERE Category = 'Electronics';

SELECT * FROM Products WHERE Category = 'Electronics';
-- 3. Create a savepoint after the initial update
SAVEPOINT SV1;


-- 4. Perform another update operation
UPDATE Products
SET Price = 1234
WHERE Category = 'Accessories';

SELECT * FROM Products WHERE Category = 'Accessories';



-- if we done with it we can COMMIT and if we want to change then we can rollback to savepoint 

--  Rollback to the first savepoint (undo changes made after this point)
ROLLBACK TO SAVEPOINT SV1 ;

-- 7. Commit the transaction to save the changes up to the first savepoint
COMMIT;

-- Note: The rollback operation undoes changes made after the first savepoint.
-- Therefore, only the changes made before `after_initial_update` will be visible after the commit.




-- ------------------------------------------- Aliases in SQL: ----------------------------------------------------

-- 1. Column Alias
-- Example: Rename ProductName to Name and Price to Cost.
SELECT ProductName AS Name, Price AS Cost
FROM Products;

-- 2. Table Alias
-- Example: Shorten Products to P.
SELECT P.ProductName, P.Price
FROM Products AS P;


-- --------------------------------------------------------- WHERE Clause--------------------------------------------------------
-- 1. Questions Using WHERE Clause
-- 1.	Question: Find all customers with the last name 'Smith'.
SELECT * FROM Customers
WHERE LastName = 'Smith';

-- 2.	Question: List all orders that have a status of 'Shipped'.
SELECT * FROM Orders
WHERE Status = 'Shipped';

-- 3.	Question: Find all order items with a quantity greater than 1.
SELECT * FROM OrderItems
WHERE Quantity > 1;

-- 4.	Question: List all customers who registered in August 2024.
SELECT * FROM Customers
WHERE RegistrationDate BETWEEN '2024-08-01' AND '2024-08-31';



-- -------------------------------------------------- GROUP BY Clause ------------------------------------------------------------
-- 2. Questions Using GROUP BY Clause
-- 1.	Question: Count the number of orders placed by each customer.
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Orders
GROUP BY CustomerID;

-- Count the number of orders per status
SELECT Status, COUNT(*) AS OrderCount
FROM Orders
GROUP BY Status;

-- 2.	Question: Find the total quantity of each product ordered.
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM OrderItems
GROUP BY ProductID;

-- 3.	Question: Get the average price of products by category.
SELECT Category, AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;

-- 4.	Question: Count the number of items in each order.
SELECT OrderID, COUNT(*) AS ItemCount
FROM OrderItems
GROUP BY OrderID;


-- --------------------------------------------------HAVING Clause----------------------------------------------------
-- 3. Questions Using HAVING Clause
-- 1.	Question: Find categories where the average price of products is above $200.
SELECT Category, AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category
HAVING AVG(Price) < 200;

-- 2.	Question: Show customers who have placed more than one order.
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 1;



-- ---------------------------------------------------  ORDER BY Clause---------------------------------------------------------
-- 4. Questions Using ORDER BY Clause
-- 1.	Question: List all customers ordered by their last name.
SELECT * FROM Customers
ORDER BY LastName; -- ASC

SELECT * FROM Customers
ORDER BY LastName DesC; -- DSC

-- 2.	Question: Get products ordered by price in descending order.
SELECT * FROM Products
ORDER BY Price DESC;

-- 2. List Products by Stock Quantity and Category
-- Question: Retrieve all products ordered by stock quantity in ascending order, 
-- and within the same stock quantity, order them by category in alphabetical order.
SELECT * FROM Products
ORDER BY StockQuantity ASC, Category ASC;

SELECT * FROM Products
ORDER BY StockQuantity DESC, Category ASC;




-- --------------------------------------------------------LIMIT Claus -------------------------------------------------------
-- 1. Examples Using LIMIT Clause
-- The LIMIT clause is used to specify the number of rows to return from the result set.
-- Example 1: Retrieve the first 3 products
SELECT * FROM Products
LIMIT 3;
-- Explanation: This query will return the first 3 rows from the Products table based on the default sorting (if any).

-- Example 2: Get the top 2 most expensive products
SELECT * FROM Products
ORDER BY Price DESC
LIMIT 2;

SELECT * FROM Products
ORDER BY Price ASC -- for bottom
LIMIT 2;
-- Explanation: This query first sorts the products by price in descending order and then limits the result to the top 2 most expensive products.
-- For least expensive, use order by ASC

-- Example 3: Fetch the first 5 orders placed
SELECT * FROM Orders
ORDER BY OrderDate
LIMIT 5;
-- Explanation: This query retrieves the first 5 orders based on the order date in ascending order, 
-- showing the earliest orders first.

-- Explanation: This query retrieves the 3 most recent orders. 
-- By sorting the orders in descending order and limiting the result, it effectively shows the latest orders.



 -- ---------------------- OFFSET Clause------------------------------------------------------------------------
-- In MySQL, you cannot use the OFFSET clause by itself. 
 -- It must be used together with the LIMIT clause. 
 -- The OFFSET clause is intended to work with LIMIT to skip a specified number of rows before starting to return rows.
-- 2. Examples Using OFFSET Clause
-- The OFFSET clause is used to skip a specific number of rows before starting to return rows from the result set.

-- Example 1: Skip the first 2 products and get the next 3
SELECT * FROM Products
LIMIT 3 OFFSET 2;
-- Explanation: This query skips the first 2 products and then returns the next 3 products from the Products table.

-- Example 2: Retrieve products starting from the 5th row
SELECT * FROM Products
OFFSET 4; -- on3y offset will not work in mysql

SELECT * FROM Products
LIMIT 18446 OFFSET 4;

-- OFFSET 4: This skips the first 4 rows, so the result starts from the 5th row.
-- LIMIT 18446744073709551615: This is a very large number, effectively ensuring that all rows after the offset are included.
-- This is a MySQL-specific approach to avoid specifying an exact row count if you want all subsequent rows.

-- Example 3: Get the 4th and 5th most expensive products
SELECT * FROM Products
ORDER BY Price DESC
LIMIT 2 OFFSET 3;
-- Explanation: This query retrieves the 4th and 5th most expensive products. 
-- It sorts products by price in descending order, skips the top 3 most expensive products, 
-- and then limits the result to the next 2 products.  


