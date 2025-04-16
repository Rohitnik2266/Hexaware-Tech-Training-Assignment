USE TechShop
GO

--1. Write an SQL query to retrieve the names and emails of all customers.  
SELECT FirstName, LastName, Email FROM Customers;
GO

-- 2. Write an SQL query to list all orders with their order dates and corresponding customer names. 
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName 
FROM Orders 
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
GO

--3. Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) 
VALUES ('Alice', 'Brown', 'alice.brown@example.com', '1122334455', '789 Pine St');
GO

--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by 
increasing them by 10%. 
UPDATE Products SET Price = Price * 1.10 WHERE ProductName IN ('Laptop', 'Smartphone');
GO

--5. Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter. 
DELETE FROM Orders WHERE OrderID = 1;
GO

--6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information. 
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES (11,2025-03-19, 100);
GO

--7. Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information. 
UPDATE Customers SET Email = 'test@gmail.com', Address = 'US' WHERE CustomerID = 6;
GO

--8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table. 
UPDATE Orders SET TotalAmount = (
    SELECT SUM(OrderDetails.Quantity * Products.Price) 
    FROM OrderDetails 
    JOIN Products ON OrderDetails.ProductID = Products.ProductID 
    WHERE OrderDetails.OrderID = Orders.OrderID
);
GO

--9. Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter. 
DELETE FROM Orders WHERE CustomerID = 5;
GO

--10. Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details. 
INSERT INTO Products (ProductName, Description, Price) VALUES ('Tablet', '10-inch display tablet', 300.00);
GO

--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status. 
UPDATE Orders SET Status = 2 WHERE OrderID = 3;
GO

--12. Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table. 
UPDATE Customers 
SET OrderCount = (
    SELECT COUNT(*) FROM Orders WHERE Orders.CustomerID = Customers.CustomerID
);
GO
