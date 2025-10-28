-- CREATE DATABASE

CREATE DATABASE Healthcare_Claims_Project;

-- USE DATABASE

USE `healthcare_claims_project`;

-- CREATE CLAIMS TABLE

CREATE TABLE Claims (
    Claim_ID VARCHAR(10) PRIMARY KEY,
    Patient_ID VARCHAR(10),
    Provider_ID VARCHAR(10),
    Diagnosis VARCHAR(50),
    Claim_Amount DECIMAL(10,2),
    Claim_Date DATE,
    Policy_Type VARCHAR(20),
    Age INT,
    Gender VARCHAR(10),
    Claim_Status VARCHAR(20),
    Payment_Method VARCHAR(20),
    Fraud_Flag TINYINT
);

-- CHECK SAMPLE DATA

SELECT * FROM Claims
LIMIT 10;

-- EXPLORE BASIC DATA

-- Total number of claims
SELECT COUNT(*) AS Total_Claims FROM Claims;

-- Total and average claim amount
SELECT SUM(Claim_Amount) AS Total_Amount, AVG(Claim_Amount) AS Avg_Amount FROM Claims;

-- Claims by Policy Type
SELECT Policy_Type, COUNT(*) AS Num_Claims, AVG(Claim_Amount) AS Avg_Amount
FROM Claims
GROUP BY Policy_Type;

-- Claims by Diagnosis
SELECT Diagnosis, COUNT(*) AS Num_Claims, AVG(Claim_Amount) AS Avg_Amount
FROM Claims
GROUP BY Diagnosis;

-- Average Claim by Payment Method

SELECT Payment_Method, 
       ROUND(AVG(Claim_Amount),2) AS Avg_Claim
FROM Claims
GROUP BY Payment_Method
ORDER BY Avg_Claim DESC;

-- Average Claims by Policy Type and Status

SELECT Policy_Type, 
       Claim_Status, 
       ROUND(AVG(Claim_Amount),2) AS Avg_Claim
FROM Claims
GROUP BY Policy_Type, Claim_Status
ORDER BY Avg_Claim DESC;

-- Claims by Age Group

SELECT 
    CASE 
        WHEN Age BETWEEN 0 AND 18 THEN '0-18'
        WHEN Age BETWEEN 19 AND 35 THEN '19-35'
        WHEN Age BETWEEN 36 AND 60 THEN '36-60'
        WHEN Age > 60 THEN '60+'
    END AS Age_Group,
    COUNT(*) AS Num_Claims,
    ROUND(AVG(Claim_Amount),2) AS Avg_Claim
FROM Claims
GROUP BY Age_Group;

-- Claims by Provider (Top 10)

SELECT Provider_ID, 
       COUNT(*) AS Num_Claims, 
       ROUND(SUM(Claim_Amount),2) AS Total_Claim_Amount
FROM Claims
GROUP BY Provider_ID
ORDER BY Total_Claim_Amount DESC
LIMIT 10;

-- Fraud-Flagged Claims

SELECT * 
FROM Claims
WHERE Fraud_Flag = 1
ORDER BY Claim_Amount DESC;

-- High-Cost Patients (Top 50)

SELECT Patient_ID, 
       COUNT(*) AS Claim_Count, 
       ROUND(SUM(Claim_Amount),2) AS Total_Claim_Amount
FROM Claims
GROUP BY Patient_ID
HAVING SUM(Claim_Amount) > 50000
ORDER BY Total_Claim_Amount DESC
LIMIT 50;

-- High-Cost Diagnoses

SELECT Diagnosis, 
       ROUND(AVG(Claim_Amount),2) AS Avg_Claim
FROM Claims
GROUP BY Diagnosis
ORDER BY Avg_Claim DESC;

-- Monthly Claims Trend

SELECT YEAR(Claim_Date) AS Year, 
       MONTH(Claim_Date) AS Month, 
       COUNT(*) AS Num_Claims
FROM Claims
GROUP BY YEAR(Claim_Date), MONTH(Claim_Date)
ORDER BY Year, Month;

-- Cumulative Claims Per Patient

SELECT Patient_ID, 
       Claim_Date, 
       Claim_Amount,
       SUM(Claim_Amount) OVER (PARTITION BY Patient_ID ORDER BY Claim_Date) AS Cumulative_Amount
FROM Claims
ORDER BY Patient_ID, Claim_Date;

-- Rank Patients by Total Claims

SELECT Patient_ID, 
       SUM(Claim_Amount) AS Total_Claim_Amount,
       RANK() OVER (ORDER BY SUM(Claim_Amount) DESC) AS Rank_Value
FROM Claims
GROUP BY Patient_ID
ORDER BY Rank_Value
LIMIT 10;

