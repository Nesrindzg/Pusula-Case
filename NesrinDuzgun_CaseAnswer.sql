create database Pusula

use Pusula

-- Create Products Table
CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName NVARCHAR(100),
Price DECIMAL(10, 2)
);

-- Insert Data into Products Table
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1500.00),
(2, 'Mouse', 25.00),
(3, 'Keyboard', 45.00);

-- Create Sales Table
CREATE TABLE Sales (
SaleID INT PRIMARY KEY,
ProductID INT,
Quantity INT,
SaleDate DATETIME,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Data into Sales Table
INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate) VALUES
(1, 1, 2, '2024-01-10'),
(2, 2, 5, '2024-01-15'),
(3, 1, 1, '2024-02-20'),
(4, 3, 3, '2024-03-05'),
(5, 2, 7, '2024-03-25'),
(6, 3, 2, '2024-04-12');

-- Yillara göre satılan ürün adedi ve toplam fiyatı
SELECT ProductName, Sum(Quantity) as 'Quantity of Product', Sum(Quantity*Price) as 'Total Price', Year(Sales.SaleDate) as 'Year'
	FROM Products, Sales WHERE Products.ProductID = Sales.ProductID GROUP BY ProductName , Year(Sales.SaleDate)

-- En çok satılan ürün adı ve toplam fiyatı
SELECT TOP 1 ProductName, Sum(Quantity*Price) as 'Total Price' FROM Products, Sales 
	WHERE Products.ProductID = Sales.ProductID GROUP BY ProductName ORDER BY 'Total Price' DESC 
	
