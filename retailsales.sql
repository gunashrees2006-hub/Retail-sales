create database retailsales;
show databases;
use retailsales;
CREATE TABLE Products (product_id INT PRIMARY KEY,product_name varchar(50),
category varchar(50),price INT);
CREATE TABLE Customers (customer_id INT PRIMARY KEY,customer_name varchar(50),
age INT,city varchar(50));
CREATE TABLE Sales (sale_id INT PRIMARY KEY,product_id INT,customer_id INT,
quantity INT,sale_date varchar(50),FOREIGN KEY (product_id) REFERENCES Products(product_id),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id));
INSERT INTO Products VALUES(1, 'Laptop', 'Electronics', 70000);
INSERT INTO Products VALUES(2, 'Phone', 'Electronics', 40000);
INSERT INTO Products VALUES(3, 'Shoes', 'Fashion', 2500);
INSERT INTO Products VALUES(4, 'T-shirt', 'Fashion', 1200);
INSERT INTO Products VALUES(5, 'Book', 'Stationery', 400);
INSERT INTO Products VALUES(6, 'Bag', 'Accessories', 1500);
INSERT INTO Products VALUES(7, 'Headphones', 'Electronics', 2000);
INSERT INTO Products VALUES(8, 'Watch', 'Accessories', 3500);
INSERT INTO Products VALUES(9, 'Notebook', 'Stationery', 200);
INSERT INTO Products VALUES(10, 'Camera', 'Electronics', 55000);
INSERT INTO Customers VALUES(1, 'Aarav', 25, 'Mumbai');
INSERT INTO Customers VALUES(2, 'Priya', 32, 'Delhi');
INSERT INTO Customers VALUES(3, 'Karan', 28, 'Pune');
INSERT INTO Customers VALUES(4, 'Meena', 35, 'Chennai');
INSERT INTO Customers VALUES(5, 'Ravi', 22, 'Bangalore');
INSERT INTO Customers VALUES(6, 'Sanya', 27, 'Hyderabad');
INSERT INTO Customers VALUES(7, 'Isha', 30, 'Kolkata');
INSERT INTO Customers VALUES(8, 'Rohan', 40, 'Ahmedabad');
INSERT INTO Customers VALUES(9, 'Neha', 26, 'Pune');
INSERT INTO Customers VALUES(10, 'Vikram', 33, 'Delhi');
INSERT INTO Sales VALUES(1, 1, 1, 1, '2025-10-01');
INSERT INTO Sales VALUES(2, 2, 3, 2, '2025-10-02');
INSERT INTO Sales VALUES(3, 3, 2, 1, '2025-10-03');
INSERT INTO Sales VALUES(4, 4, 5, 3, '2025-10-04');
INSERT INTO Sales VALUES(5, 1, 4, 1, '2025-10-05');
INSERT INTO Sales VALUES(6, 2, 1, 1, '2025-10-06');
INSERT INTO Sales VALUES(7, 5, 2, 5, '2025-10-07');
INSERT INTO Sales VALUES(8, 3, 4, 2, '2025-10-08');
INSERT INTO Sales VALUES(9, 4, 3, 1, '2025-10-09');
INSERT INTO Sales VALUES(10, 5, 5, 3, '2025-10-10');
SELECT 
    p.product_name,
    SUM(s.quantity) AS total_quantity_sold
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 1;

SELECT 
    p.category,
    SUM(s.quantity * p.price) AS total_sales_amount
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales_amount DESC;

SELECT 
    c.customer_name,
    ROUND(AVG(s.quantity * p.price), 2) AS avg_purchase_value
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
JOIN Customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY avg_purchase_value DESC;

SELECT 
    s.sale_date,
    SUM(s.quantity * p.price) AS total_sales
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY s.sale_date
ORDER BY s.sale_date;