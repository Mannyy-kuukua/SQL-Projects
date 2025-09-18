-- CREATE DATABASE 
CREATE DATABASE Sales;
USE Sales;
-- VIEWING DATA
SELECT *
FROM salessss;
-- DUPLICATING THE TABLE
CREATE TABLE `store_order` (
  `Order ID` INT PRIMARY KEY,
  `Date` DATE,
  `Product` TEXT,
  `Price` DECIMAL (10,2),
  `Quantity` DECIMAL(10,2),
  `Purchase Type` TEXT,
  `Payment Method` TEXT,
  `Manager` TEXT,
  `City` TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- TO IMPORT THE DATA INTO ANOTHER TABLE ALL COLUMNS AND DATA TYPE SHOULD BE THE SAME
-- SET DATE COLUMN TO A DATE AND MODIFY THE DATA TYPE TO A DATE
UPDATE salessss
SET `Date` =STR_TO_DATE(`Date`, '%d/%m/%Y');
ALTER TABLE salessss
MODIFY COLUMN `Date` DATE;
-- INSERTING DATA INTO THE DUPLICATED TABLE
INSERT INTO store_order
SELECT *
FROM salessss;

-- VIEWING OUR NEW TABLE
SELECT *
FROM store_order;
ALTER TABLE store_order
CHANGE COLUMN `Payment Method` `Payment_method` TEXT;
ALTER TABLE store_order
CHANGE COLUMN `Purchase Type` `Purchase_type` TEXT;
ALTER TABLE store_order
CHANGE COLUMN `Order ID` `Order_id` INT;
-- CLEANING OUR DATA
# the manager coloumn has extra spaces in some rows at the beginning and end ..  
UPDATE store_order
SET Manager=TRIM(Manager);
# TOM JACKSON,Pablo PEREZ,REMY MONET,JOAO SILVA
-- FOR ROWS WITH EXTRA SPACES BETWEEN NAMES WE UPDATE USING THE WHERE CLAUSE TO STANDARDIZE THE DATA
UPDATE store_order
SET Manager= 'Tom Jackson'
WHERE Manager ='Tom      Jackson';
UPDATE store_order
SET Manager='Joao Silva'
WHERE Manager='Joao    Silva';
UPDATE store_order
SET Manager='Pablo Perez'
WHERE Manager ='Pablo   Perez';
UPDATE store_order
SET Manager='Pablo Perez'
WHERE Manager ='Pablo    Perez';
UPDATE store_order
SET Manager='Remy Monet'
WHERE Manager ='Remy     Monet';
UPDATE store_order
SET Manager='Remy Monet'
WHERE Manager ='Remy    Monet';

-- ensuring INTACT DATA


SELECT *
FROM store_order;
-- 1. Find the total revenve for the company
-- 2. Total revenue per country
-- 3. Top selling product And Top selling product in each country
-- 4. Most Used payment type
-- 5. Which store receives most orders
-- 6. Top manager
-- 7. Monthly Sales
-- 8. Does payment method influence revenue
-- 9. Does purchase type influence revenue
-- 10. Average price,average quantity
-- 11. How each product sells on each day
-- 12. Frequency on what people are buying 

### Calculating/ adding a revenue column alter
ALTER TABLE store_order
ADD COLUMN Revenue DECIMAL(10,2);

-- inserting the values into revenue column
UPDATE store_order
SET revenue =Price*Quantity;

-- TOTAL REVENUE 
SELECT SUM(Revenue) AS Total_Revenue
FROM store_order;

-- TOTAL REVENUE PER COUNTRY
SELECT City, SUM(Revenue) AS Revenue_per_city
FROM store_order
GROUP BY City 
ORDER BY Revenue_per_city DESC;

-- REVENUE PER PRODUCT
SELECT Product,SUM(Revenue) AS Revenue_generated
FROM store_order
GROUP BY Product
ORDER BY Revenue_generated DESC;
-- Total orders
SELECT COUNT(Order_id) As Totalorders
FROM store_order;
-- MOST USED PAYMENT METHOD 
SELECT Payment_method, COUNT(Payment_method) AS No_of_transactions
FROM store_order
GROUP BY Payment_method
ORDER BY No_of_transactions DESC;

-- STORES RECEIVING MOST ORDERS
SELECT Purchase_type,count(Order_id) As Total_Orders
FROM store_order
GROUP BY 
Purchase_type;
-- Branches with most orders
SELECT city,Count(Order_id)AS Total_orders
FROM store_order
GROUP BY city
ORDER BY Total_orders DESC;
-- TOP MANAGER--
SELECT Manager,SUM(Revenue) AS Sales
FROM store_order
GROUP BY Manager
ORDER BY SUM(Revenue) DESC
; 

-- MONTHLY SALES & Daily Sales
SELECT   DATE_FORMAT(Date
, '%Y-%m') AS transaction_month,
SUM(Revenue) AS Total
FROM store_order
GROUP BY transaction_month;
SELECT Date,SUM(Revenue) AS Daily_revenue
FROM store_order
GROUP BY Date;
-- PAYMENT METHOD AND REVENUE
SELECT Payment_method, SUM(Revenue)AS Total_revenue
FROM store_order
GROUP BY Payment_method
ORDER BY Total_revenue DESC;

-- PURCHASE TYPE and REVENUE
SELECT Purchase_type,SUM(Revenue) AS Revenue
FROM store_order
GROUP BY Purchase_type
;

SELECT Purchase_type,City,SUM(Revenue) AS Revenue
FROM store_order
WHERE City ='London'
GROUP BY Purchase_type,City
ORDER BY SUM(Revenue) DESC;

SELECT *
FROM store_order
WHERE City ='London';

SELECT Purchase_type,City,SUM(Revenue) AS Revenue
FROM store_order
WHERE City ='Lisbon'
GROUP BY Purchase_type,City
ORDER BY SUM(Revenue) DESC;

SELECT Purchase_type,City,SUM(Revenue) AS Revenue
FROM store_order
WHERE City ='Paris'
GROUP BY Purchase_type,City
ORDER BY SUM(Revenue) DESC;

SELECT Purchase_type,City,SUM(Revenue) AS Revenue
FROM store_order
WHERE City ='Madrid'
GROUP BY Purchase_type,City
ORDER BY SUM(Revenue) DESC;

SELECT Purchase_type,City,SUM(Revenue) AS Revenue
FROM store_order
WHERE City ='Berlin'
GROUP BY Purchase_type,City
ORDER BY SUM(Revenue) DESC;

SELECT DAYNAME(Date) AS Week_day,
count(Order_id)AS Orders,SUM(Revenue)AS Revenue
FROM store_order
GROUP BY Week_day
ORDER BY Orders DESC
;

SELECT distinct Product
FROM store_order;
SELECT DAYNAME(Date) AS Week_day,
SUM(Quantity)AS Quantity,SUM(Revenue)AS Revenue
FROM store_order
WHERE Product ='Fries'
GROUP BY Week_day
ORDER BY Quantity DESC;

SELECT DAYNAME(Date) AS Week_day,
SUM(Quantity)AS Quantity,SUM(Revenue)AS Revenue
FROM store_order
WHERE Product ='Beverages'
GROUP BY Week_day
ORDER BY Quantity DESC;

SELECT DAYNAME(Date) AS Week_day,
SUM(Quantity)AS Quantity,SUM(Revenue)AS Revenue
FROM store_order
WHERE Product = 'Sides & other'
GROUP BY Week_day
ORDER BY Quantity DESC;

SELECT DAYNAME(Date) AS Week_day,
SUM(Quantity)AS Quantity,SUM(Revenue)AS Revenue
FROM store_order
WHERE Product ='Burgers'
GROUP BY Week_day
ORDER BY Quantity DESC;

SELECT DAYNAME(Date) AS Week_day,
SUM(Quantity)AS Quantity,SUM(Revenue)AS Revenue
FROM store_order
WHERE Product ='Chicken Sandwiches'
GROUP BY Week_day
ORDER BY Quantity DESC;