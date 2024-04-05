DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    CustomerID INT,
    CustomerName VARCHAR(50)
);


DROP TABLE IF EXISTS purchases;
CREATE TABLE Purchases (
    PurchaseID INT,
    CustomerID INT,
    ProductName VARCHAR(50),
    PurchaseDate DATE
);

INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'John'),
(2, 'Emma'),
(3, 'Michael'),
(4, 'Ben'),
(5, 'John')	;

SELECT * FROM CUSTOMERS

INSERT INTO Purchases (PurchaseID, CustomerID, ProductName, PurchaseDate) VALUES
(100, 1, 'iPhone', '2024-01-01'),
(101, 1, 'MacBook', '2024-01-20'),	
(102, 1, 'Airpods', '2024-03-10'),
(103, 2, 'iPad', '2024-03-05'),
(104, 2, 'iPhone', '2024-03-15'),
(105, 3, 'MacBook', '2024-03-20'),
(106, 3, 'Airpods', '2024-03-25'),
(107, 4, 'iPhone', '2024-03-22'),	
(108, 4, 'Airpods', '2024-03-29'),
(110, 5, 'Airpods', '2024-02-29'),
(109, 5, 'iPhone', '2024-03-22');

SELECT * FROM Purchases


--SQL query to find customers who bought Airpods after purchasing an iphone--


SELECT
DISTINCT c.*
FROM CUSTOMERS c
JOIN purchases p on c.customerid= p.customerid
JOIN purchases p1 on c.customerid=p1.customerid
where p.productname='iPhone'
and p1.productname='Airpods'
and p.purchasedate<p1.purchasedate


--% of chance is there that the customer who bought macbook will buy airpods--


SELECT
DISTINCT c.*
FROM CUSTOMERS c
JOIN purchases p on c.customerid= p.customerid
JOIN purchases p1 on c.customerid=p1.customerid
where p.productname='Macbook'
and p1.productname='Airpods'
and p.purchasedate<p1.purchasedate


SELECT c.*, p.*
FROM CUSTOMERS c
JOIN purchases p ON c.customerid = p.customerid
WHERE p.productname = 'MacBook'


UNION 


SELECT c.*, p.*
FROM CUSTOMERS c
JOIN purchases p ON c.customerid = p.customerid
WHERE p.productname = 'AirPods'


SELECT 
    COUNT(DISTINCT m1.customerid) AS macbook_users,
    COUNT(DISTINCT m2.customerid) AS airpods_users,
    COUNT(DISTINCT CASE WHEN m2.customerid IS NOT NULL THEN m1.customerid END) AS both_users,
    COUNT(DISTINCT CASE WHEN m2.customerid IS NOT NULL THEN m1.customerid END) * 100.0 / COUNT(DISTINCT m1.customerid) AS percentage
FROM 
    (SELECT c.customerid
     FROM CUSTOMERS c
     JOIN purchases p ON c.customerid = p.customerid
     WHERE p.productname = 'MacBook') AS m1
LEFT JOIN 
    (SELECT c.customerid
     FROM CUSTOMERS c
     JOIN purchases p ON c.customerid = p.customerid
     WHERE p.productname = 'AirPods') AS m2 ON m1.customerid = m2.customerid;




