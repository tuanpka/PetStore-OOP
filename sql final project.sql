-- Tạo cơ sở dữ liệu cho cửa hàng thú cưng
CREATE DATABASE IF NOT EXISTS PetStore;

-- Sử dụng cơ sở dữ liệu mới
USE PetStore;

-- Tạo bảng Khách hàng
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address TEXT
);

-- Tạo bảng Thú cưng
CREATE TABLE IF NOT EXISTS Pets (
    PetID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Species VARCHAR(50),
    Breed VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Tạo bảng Sản phẩm
CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    StockQuantity INT
);

-- Tạo bảng Đơn hàng
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Tạo bảng Chi tiết đơn hàng
CREATE TABLE IF NOT EXISTS OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    ServiceID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Tạo bảng Nhà cung cấp
CREATE TABLE IF NOT EXISTS Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(100),
    Phone VARCHAR(20)
);

-- Tạo bảng Dịch vụ
CREATE TABLE IF NOT EXISTS Services (
    ServiceID INT PRIMARY KEY AUTO_INCREMENT,
    ServiceName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2)
);

-- Thêm dữ liệu mẫu vào bảng Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES
    ('TestCustomer1', 'Lastname1', 'test1@example.com', '123-456-7890', '123 Main St'),
    ('TestCustomer2', 'Lastname2', 'test2@example.com', '234-567-8901', '456 Elm St');

-- Thêm dữ liệu mẫu vào bảng Pets
INSERT INTO Pets (Name, Species, Breed, Age, Gender, CustomerID)
VALUES
    ('TestPet1', 'Dog', 'Labrador', 3, 'Male', 1),
    ('TestPet2', 'Cat', 'Siamese', 2, 'Female', 2);

-- Thêm dữ liệu mẫu vào bảng Products
INSERT INTO Products (Name, Description, Price, StockQuantity)
VALUES
    ('Product1', 'Description for Product 1', 19.99, 100),
    ('Product2', 'Description for Product 2', 29.99, 50);

-- Thêm dữ liệu mẫu vào bảng Services
INSERT INTO Services (ServiceName, Description, Price)
VALUES
    ('Grooming', 'Basic grooming service', 35.00),
    ('Nail Trim', 'Nail trimming service', 10.00);

-- Thêm dữ liệu mẫu vào bảng Suppliers
INSERT INTO Suppliers (SupplierName, ContactName, Phone)
VALUES
    ('Supplier1', 'Contact1', '555-123-4567'),
    ('Supplier2', 'Contact2', '555-987-6543');

