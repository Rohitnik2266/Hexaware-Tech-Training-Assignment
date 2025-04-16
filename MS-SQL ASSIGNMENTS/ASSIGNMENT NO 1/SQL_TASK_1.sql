--1. Create the database named "TechShop" 
CREATE DATABASE TechShop;
GO
USE TechShop;
GO

--2. Define the schema for the Customers, Products, Orders, OrderDetails and Inventory tables based on the provided schema. 
--4. Create appropriate Primary Key and Foreign Key constraints for referential integrity. 
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    Phone NVARCHAR(15),
    Address NVARCHAR(255)
);
GO

CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100),
    Description NVARCHAR(MAX),
    Price DECIMAL(10,2)
);
GO

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);
GO

CREATE TABLE OrderDetails (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);
GO

CREATE TABLE Inventory (
    InventoryID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);
GO

--5. Insert at least 10 sample records into each of the following tables. 
--a. Customers 
--b. Products 
--c. Orders	
--d. OrderDetails  
--e. Inventory 
-- Sample data insertion for Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak St'),
('Alice', 'Brown', 'alice.brown@example.com', '1122334455', '789 Pine St'),
('Bob', 'Johnson', 'bob.johnson@example.com', '2233445566', '987 Cedar St'),
('Charlie', 'Davis', 'charlie.davis@example.com', '3344556677', '654 Maple St'),
('David', 'Miller', 'david.miller@example.com', '4455667788', '321 Birch St'),
('Ella', 'Wilson', 'ella.wilson@example.com', '5566778899', '159 Cherry St'),
('Frank', 'Moore', 'frank.moore@example.com', '6677889900', '753 Walnut St'),
('Grace', 'Taylor', 'grace.taylor@example.com', '7788990011', '852 Oakwood St'),
('Henry', 'Anderson', 'henry.anderson@example.com', '8899001122', '963 Willow St');
GO

INSERT INTO Products (ProductName, Description, Price) VALUES
('Laptop', 'High performance laptop', 800.00),
('Smartphone', 'Latest model smartphone', 600.00),
('Tablet', '10-inch display tablet', 300.00),
('Smartwatch', 'Wearable smart device', 200.00),
('Headphones', 'Noise-cancelling headphones', 150.00),
('Keyboard', 'Mechanical keyboard', 100.00),
('Mouse', 'Wireless optical mouse', 50.00),
('Monitor', '27-inch 4K monitor', 400.00),
('Printer', 'Wireless inkjet printer', 250.00),
('External Hard Drive', '1TB SSD external drive', 120.00);
GO

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2025-03-20', 1400.00),
(2, '2025-03-19', 600.00),
(3, '2025-03-18', 500.00),
(4, '2025-03-17', 350.00),
(5, '2025-03-16', 900.00),
(6, '2025-03-15', 750.00),
(7, '2025-03-14', 650.00),
(8, '2025-03-13', 300.00),
(9, '2025-03-12', 1200.00),
(10, '2025-03-11', 400.00);
GO

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 2),
(3, 4, 1),
(4, 5, 3),
(5, 6, 2),
(6, 7, 4),
(7, 8, 1),
(8, 9, 1),
(9, 10, 2);
GO

INSERT INTO Inventory (ProductID, QuantityInStock) VALUES
(1, 10),
(2, 20),
(3, 15),
(4, 25),
(5, 30),
(6, 18),
(7, 40),
(8, 12),
(9, 14),
(10, 22);
GO
