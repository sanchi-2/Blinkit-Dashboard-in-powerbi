CREATE DATABASE blinkit;
USE blinkit;
SHOW DATABASES;
USE blinkit;
CREATE TABLE blinkit_data (
    Item_Identifier VARCHAR(20),
    Item_Weight VARCHAR(20),
    Item_Fat_Content VARCHAR(20),
    Item_Visibility FLOAT,
    Item_Type VARCHAR(50),
    Item_MRP FLOAT,
    Outlet_Identifier VARCHAR(20),
    Outlet_Establishment_Year INT,
    Outlet_Size VARCHAR(20),
    Outlet_Location_Type VARCHAR(20),
    Outlet_Type VARCHAR(30),
    Rating FLOAT,
    Total_Sales FLOAT
);
SELECT * FROM blinkit_data;

DESCRIBE blinkit_data;


SELECT COUNT(*) AS Total_Records FROM blinkit_data;


SELECT * FROM blinkit_data
ORDER BY Total_Sales DESC
LIMIT 5;


#Total sales
SELECT ROUND(SUM(Total_Sales), 2) AS Total_Sales
FROM blinkit_data;
#Average sales
SELECT ROUND(AVG(Total_Sales), 2) AS Avg_Sales
FROM blinkit_data;
#Number of items
SELECT COUNT(*) AS No_of_Items
FROM blinkit_data;
#average rating
SELECT ROUND(AVG(Rating), 2) AS Avg_Rating
FROM blinkit_data;
# Total Sales by Fat Content
SELECT Item_Fat_Content,
       ROUND(SUM(Total_Sales), 2) AS Total_Sales
FROM blinkit_data
GROUP BY Item_Fat_Content
ORDER BY Total_Sales DESC;

#Total Sales by Item Type
SELECT Item_Type,
       ROUND(SUM(Total_Sales), 2) AS Total_Sales
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC;

#Total Sales by Outlet Establishment Year
SELECT Outlet_Establishment_Year,
       ROUND(SUM(Total_Sales), 2) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year;

#Top 5 Performing Item Types
SELECT Item_Type,
       ROUND(SUM(Total_Sales), 2) AS Total_Sales
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC
LIMIT 5;


ALTER USER 'root'@'localhost'
IDENTIFIED WITH mysql_native_password BY 'root123';
FLUSH PRIVILEGES;

SELECT user, host, plugin FROM mysql.user;