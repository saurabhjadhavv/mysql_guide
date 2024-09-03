DROP TABLE if exists customers;

-- Create CUSTOMER table

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    RegistrationDate DATE
);

-- Insert data into Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone, RegistrationDate) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234', '2024-09-01'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678', '2024-09-02'),
('Emily', 'Jones', 'emily.jones@example.com', '555-8765', '2024-09-03'),
('Michael', 'Brown', 'michael.brown@example.com', '555-4321', '2024-09-04'),
('Laura', 'Wilson', 'laura.wilson@example.com', '555-1357', '2024-09-05');


-- Create Products table
DROP TABLE if exists Products;
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT DEFAULT 0,
    Category VARCHAR(50)
);
-- Insert data into Products
INSERT INTO Products (ProductName, Description, Price, StockQuantity, Category) VALUES
('Laptop', '15-inch laptop with 16GB RAM and 512GB SSD', 999.99, 50, 'Electronics'),
('Smartphone', 'Latest model smartphone with 128GB storage', 499.99, 100, 'Electronics'),
('Headphones', 'Noise-cancelling over-ear headphones', 149.99, 75, 'Accessories'),
('Office Chair', 'Ergonomic office chair with lumbar support', 299.99, 20, 'Furniture'),
('Desk Lamp', 'Adjustable desk lamp with LED light', 89.99, 30, 'Furniture');

-- Create Orders table
DROP TABLE if exists Orders;
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status varchar(11) DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into Orders
INSERT INTO Orders (CustomerID, OrderDate, Status) VALUES
(1, '2024-08-01', 'Shipped'),
(2, '2024-08-15', 'Delivered'),
(3, '2024-08-20', 'Pending'),
(1, '2024-08-25', 'Cancelled'),
(4, '2024-08-28', 'Shipped');

DRop table if exists OrderItems;
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT DEFAULT 1,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert data into OrderItems
INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 999.99),
(1, 3, 2, 149.99),
(2, 2, 1, 499.99),
(2, 4, 1, 299.99),
(3, 5, 1, 89.99),
(4, 1, 1, 999.99),
(5, 4, 1, 299.99);

