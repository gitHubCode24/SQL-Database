# Answer 06
-- -----------------------------------------------------------
-- 1. DATABASE CREATION AND CONTEXT
-- This script assumes a MySQL/PostgreSQL environment for syntax.
-- We start by attempting to drop and create the database for a clean run.
-- -----------------------------------------------------------
-- Attempt to drop the database if it exists (for clean execution)
DROP DATABASE IF EXISTS ECommerceDB;

-- Create the new database
CREATE DATABASE ECommerceDB;

-- Use the new database
USE ECommerceDB;

-- -----------------------------------------------------------
-- 2. TABLE CREATION WITH CONSTRAINTS
-- -----------------------------------------------------------
-- Table: Categories
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);

-- Table: Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE, -- Ensures no two customers share the same email
    JoinDate DATE
);

-- Table: Products (Depends on Categories, so Foreign Key will be added here)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL UNIQUE, -- Ensures no two products have the same name
    CategoryID INT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT,
    -- Foreign Key Constraint to link product to its category
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Table: Orders (Depends on Customers, so Foreign Key will be added here)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2),
    -- Foreign Key Constraint to link order to its customer
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- -----------------------------------------------------------
-- 3. DATA INSERTION
-- NOTE: Data must be inserted into parent tables (Categories, Customers)
--       before child tables (Products, Orders) to satisfy FOREIGN KEY constraints.
-- -----------------------------------------------------------

-- Insert data into Categories
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Books'),
(3, 'Home Goods'),
(4, 'Apparel');

-- Insert data into Customers
INSERT INTO Customers (CustomerID, CustomerName, Email, JoinDate) VALUES
(1, 'Alice Wonderland', 'alice@example.com', '2023-01-10'),
(2, 'Bob the Builder', 'bob@example.com', '2022-11-25'),
(3, 'Charlie Chaplin', 'charlie@example.com', '2023-03-01'),
(4, 'Diana Prince', 'diana@example.com', '2021-04-26');

-- Insert data into Products
INSERT INTO Products (ProductID, ProductName, CategoryID, Price, StockQuantity) VALUES
(101, 'Laptop Pro', 1, 1200.00, 50),
(102, 'SQL Handbook', 2, 45.50, 200),
(103, 'Smart Speaker', 1, 99.99, 150),
(104, 'Coffee Maker', 3, 75.00, 80),
(105, 'Novel : The Great SQL', 2, 25.00, 120),
(106, 'Wireless Earbuds', 1, 150.00, 100),
(107, 'Blender X', 3, 120.00, 60),
(108, 'T-Shirt Casual', 4, 20.00, 300);

-- Insert data into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1001, 1, '2023-04-26', 1245.50),
(1002, 2, '2023-10-12', 99.99),
(1003, 1, '2023-07-01', 145.00),
(1004, 3, '2023-01-14', 150.00),
(1005, 2, '2023-09-24', 120.00),
(1006, 1, '2023-06-19', 20.00);

-- -----------------------------------------------------------
-- 4. VERIFICATION (Optional but useful for assignment)
-- -----------------------------------------------------------
SELECT * FROM Categories;
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;