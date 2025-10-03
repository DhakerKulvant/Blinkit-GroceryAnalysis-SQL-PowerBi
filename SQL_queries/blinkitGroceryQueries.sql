select * from blinkitgrocerydata;

-- set column name
ALTER TABLE blinkitgrocerydata
CHANGE `ï»¿Item Fat Content` `Item Fat Content` VARCHAR(255);

SHOW COLUMNS FROM blinkitgrocerydata;


-- Data Cleaning 
SET SQL_SAFE_UPDATES = 0;

UPDATE blinkitgrocerydata
SET `Item Fat Content` = 
    CASE 
        WHEN `Item Fat Content` IN ('LF', 'low fat') THEN 'Low Fat'
        WHEN `Item Fat Content` = 'reg' THEN 'Regular'
        ELSE `Item Fat Content`
    END;

SELECT DISTINCT `Item Fat Content` FROM blinkitgrocerydata;

-- for KPI' 

SELECT CAST(SUM(`Total Sales`) / 1000000.0 AS DECIMAL(10,2)) AS `Total Sales Million`
FROM blinkitgrocerydata;

SELECT CAST(AVG(`Total Sales`) AS INT) AS `Avg Sales`
FROM blinkitgrocerydata;

SELECT COUNT(*) AS `No of Orders`
FROM  blinkitgrocerydata;

SELECT CAST(AVG(Rating) AS DECIMAL(10,1)) AS `Avg Rating`
FROM blinkitgrocerydata;

-- Total Sales by Fat Content:
SELECT `Item Fat Content`, CAST(SUM(`Total Sales`) AS DECIMAL(10,2)) AS `Total Sales`
FROM blinkitgrocerydata
GROUP BY `Item Fat Content`;

-- Total Sales by Item Type
SELECT `Item Type`, CAST(SUM(`Total Sales`) AS DECIMAL(10,2)) AS `Total Sales`
FROM blinkitgrocerydata
GROUP BY `Item Type`
ORDER BY `Total Sales` DESC;

-- Fat Content by Outlet for Total Sales
SELECT 
    `Outlet Location Type`,
    SUM(CASE WHEN `Item Fat Content` = 'Low Fat' THEN `Total Sales` ELSE 0 END) AS Low_Fat,
    SUM(CASE WHEN `Item Fat Content` = 'Regular' THEN `Total Sales` ELSE 0 END) AS Regular
FROM 
    blinkitgrocerydata
GROUP BY 
    `Outlet Location Type`
ORDER BY 
    `Outlet Location Type`;

-- Total Sales by Outlet Establishment
SELECT `Outlet Establishment Year`, CAST(SUM(`Total Sales`) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkitgrocerydata
GROUP BY `Outlet Establishment Year`
ORDER BY `Outlet Establishment Year`

-- Percentage of Sales by Outlet Size
SELECT 
    `Outlet Size`, 
    CAST(SUM(`Total Sales`) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM(`Total Sales`) * 100.0 / (SELECT SUM(`Total Sales`) FROM blinkitgrocerydata)) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkitgrocerydata
GROUP BY `Outlet Size`
ORDER BY Total_Sales DESC;

-- Sales by Outlet Location
SELECT `Outlet Location Type`, CAST(SUM(`Total Sales`) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkitgrocerydata
GROUP BY `Outlet Location Type`
ORDER BY `Total Sales` DESC

-- All Metrics by Outlet Type:
SELECT 
    `Outlet Type`, 
    CAST(SUM(`Total Sales`) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(AVG(`Total Sales`) AS DECIMAL(10,0)) AS Avg_Sales,
    COUNT(*) AS `No Of Items`,
    CAST(AVG(`Rating`) AS DECIMAL(10,2)) AS Avg_Rating,
    CAST(AVG(`Item Visibility`) AS DECIMAL(10,2)) AS Item_Visibility
FROM blinkitgrocerydata
GROUP BY `Outlet Type`
ORDER BY Total_Sales DESC;

