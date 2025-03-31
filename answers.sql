--Question 1
-- Achieving 1NF (First Normal Form)
-- Transforming ProductDetail table to ensure atomicity

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255),
    PRIMARY KEY (OrderID, Product)
);

-- Inserting normalized data
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES 
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

--Question 2
-- Achieving 2NF (Second Normal Form)
-- Splitting OrderDetails table to remove partial dependencies

-- Creating Customers table to separate CustomerName from OrderDetails
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(255) UNIQUE
);

-- Inserting distinct customers
INSERT INTO Customers (CustomerName) VALUES 
('John Doe'),
('Jane Smith'),
('Emily Clark');

-- Creating Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Inserting orders linked to customers
INSERT INTO Orders (OrderID, CustomerID) VALUES 
(101, 1),
(102, 2),
(103, 3);

-- Creating OrderDetails table to store order-product relationships
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Inserting normalized order details
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity) VALUES 
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
