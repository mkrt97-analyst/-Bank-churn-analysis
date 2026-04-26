CREATE DATABASE churn_db;

USE churn_db;

SELECT count(*) 
FROM churn_modelling;

SELECT * 
FROM churn_modelling
LIMIT 10;

# COUNT TOTAL CUSTOMERS AND CHURNED CUSTOMERS
 SELECT
    COUNT(*) AS total_customers,
    SUM(Exited) AS total_churned
    FROM Churn_Modelling;

#CHURN RATE BY COUNTRY
SELECT Geography AS country,
    COUNT(*) AS total,
    SUM(Exited) AS churned,
    ROUND( SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM Churn_Modelling
GROUP BY Geography
ORDER BY churnrate DESC;

#CHURN RATE BY ACTIVE VS INACTIVE MEMBERS
SELECT
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS member_status,
    COUNT(*) AS total,
    ROUND( SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate 
FROM Churn_Modelling
GROUP BY IsActiveMember;

#CHURN RATE BY NUMBER OF PRODUCTS
SELECT NumOfProducts AS products_held,
    COUNT(*) AS total_customers,
    ROUND( SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM Churn_Modelling
GROUP BY numofproducts
ORDER BY numofproducts;

#LOOK AT ONLY GERMAN CUSTOMERS
SELECT Gender,
  COUNT(*) AS total,
  ROUND(SUM(Exited) * 100.0 / COUNT(*),2)AS churn_percent
FROM Churn_Modelling
WHERE Geography = 'Germany' 
GROUP BY Gender;

###################################