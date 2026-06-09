-- Project Title

-- Customer Churn Analysis 

-- Project Objective

-- Analyze Customer Churn and Identify Factors Affecting Customer Retention.

-- Business Requirements

-- 1. Total Customers
-- 2. Active Customers
-- 3. Churned Customers
-- 4. Churn Rate
-- 5. Gender-wise Churn
-- 6. Contract-wise Churn
-- 7. Internet Service-wise Churn
-- 8. Monthly Charges Analysis
-- 9. Customer Tenure Analysis

-- CREATE DATABASE
CREATE DATABASE Customer_Churn;
USE Customer_Churn;

-- Data UnderStanding
SELECT TOP 10 * FROM Customer_Churn;

SELECT COUNT (*) AS Total_Rows FROM Customer_Churn;

SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Customer_Churn';

-- Explanation
-- Dataset Name: Telco Customer Churn

-- Total Rows: 7043
-- Total Columns: 21
-- Key Columns:
-- CustomerID
-- Gender
-- SeniorCitizen
-- Partner
-- Dependents
-- Tenure
-- InternetService
-- Contract
-- PaymentMethod
-- MonthlyCharges
-- TotalCharges
-- Churn

-- Data Cleaning

-- Total Null Count
SELECT COUNT (*) AS Null_TotalCharges FROM Customer_Churn WHERE TotalCharges IS NULL; 

-- Monthly Charges NULL Check
SELECT COUNT (*) AS Null_MonthlyCharges FROM Customer_Churn WHERE MonthlyCharges IS NULL; 

-- Duplicate Customer Check
SELECT customerID, COUNT (*) AS Duplicate_Count FROM Customer_Churn GROUP BY customerID HAVING COUNT (*) > 1; 

-- Churn Distribution
SELECT Churn, COUNT (*) AS Customer_Count FROM Customer_Churn GROUP BY Churn;

-- Delete Null Values
DELETE FROM Customer_Churn WHERE TotalCharges IS NULL;

-- Explanation
-- 1. Removed 11 records with NULL TotalCharges.
-- 2. No NULL values found in MonthlyCharges.
-- 3. No duplicate Customer IDs found.
-- 4. Data types validated successfully.

-- KPI Analysis

-- Total Customers
SELECT COUNT(*) AS Total_Customers FROM Customer_Churn;

-- Churn Customers
SELECT COUNT (*) AS Churn_Customers FROM Customer_Churn WHERE Churn = 1;

-- Active Customers
SELECT COUNT (*) AS Active_Customers FROM Customer_Churn Where Churn = 0;

-- Churn Rate %
SELECT ROUND(COUNT(CASE WHEN Churn = 1 THEN 1 END) * 100.0 / COUNT (*), 2 ) AS Churn_Rate_Percentage FROM Customer_Churn;

-- Average Monthly Charges
SELECT ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charges FROM Customer_Churn;

-- Explanation
-- Total Customers      : 7032
-- Active Customers     : 5163
-- Churn Customers      : 1869
-- Churn Rate           : 26.58%
-- Avg Monthly Charges  : 64.80

-- Customer Analysis

-- Gender-Wise Churn
SELECT gender , COUNT (*) AS Total_Customers, SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churn_Customers
FROM Customer_Churn GROUP BY gender;

-- EXPLANATION
-- 1. Male Churn Customers   = 930
-- 2. Female Churn Customers = 939

-- Insight: Customer churn is similar across both genders.

-- Contract-Wise Churn 
SELECT Contract,COUNT (*) AS Total_Customers, SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churn_Customers
FROM Customer_Churn GROUP BY Contract ORDER BY Churn_Customers DESC;

-- EXPLANATION
-- 1. Month-to-Month contracts have the highest churn.
-- 2. Two-Year contracts have the lowest churn.

-- Business Recommendation: Encourage customers to move to long-term contracts.

-- Internet Service-wise Churn
SELECT InternetService, COUNT(*) AS Total_Customers, SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churn_Customers 
FROM Customer_Churn GROUP BY InternetService ORDER BY Churn_Customers DESC;

-- EXPLANATION
-- 1. Fiber Optic customers have the highest churn.
-- 2. Customers without internet service show low churn.

-- Business Recommendation: Review Fiber Optic pricing and service quality.

-- Payment Method-wise Churn
SELECT PaymentMethod, COUNT (*) AS Total_Customers, SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churn_Customers
FROM Customer_Churn GROUP BY PaymentMethod ORDER BY Churn_Customers DESC;

-- EXPLANATION
-- 1. Electronic Check customers have the highest churn.
-- 2. Automatic payment methods show lower churn.

-- Business Recommendation: Promote automatic payment methods.

-- Final Business Insights 

-- 1. Churn Rate = 26.58%

-- 2. Gender has minimal impact on churn.

-- 3. Month-to-Month customers show the highest churn.

-- 4. Two-Year contract customers show the lowest churn.

-- 5. Fiber Optic customers have the highest churn.

-- 6. Electronic Check users have the highest churn.

-- Recommendations:

-- Promote long-term contracts.
-- Improve Fiber Optic service experience.
-- Encourage automatic payment methods.
-- Focus retention efforts on high-risk customers.
