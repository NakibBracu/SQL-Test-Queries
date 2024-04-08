use school;
-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

-- Create Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    CategoryID INT,
    CONSTRAINT fk_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT fk_CategoryID FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Insert sample data into Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES (1, 'John', 'Doe', 'john@example.com'),
       (2, 'Jane', 'Smith', 'jane@example.com'),
       (3, 'David', 'Johnson', 'david@example.com');

-- Insert sample data into Categories table
INSERT INTO Categories (CategoryID, CategoryName)
VALUES (1, 'Electronics'),
       (2, 'Clothing'),
       (3, 'Books');

-- Insert sample data into Orders table with last 365 days order records
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount, CategoryID)
VALUES (1, 1, DATEADD(day, -10, GETDATE()), 100.00, 1),
       (2, 2, DATEADD(day, -100, GETDATE()), 150.00, 2),
       (3, 3, DATEADD(day, -200, GETDATE()), 200.00, 1),
       (4, 1, DATEADD(day, -300, GETDATE()), 120.00, 3),
       (5, 2, DATEADD(day, -365, GETDATE()), 180.00, 2),
       (6, 3, DATEADD(day, -150, GETDATE()), 220.00, 1);

