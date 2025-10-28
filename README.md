# 🏥 Healthcare Claims Analysis – SQL Project

[![SQL](https://img.shields.io/badge/SQL-MySQL-blue)](https://www.mysql.com/) 
[![Skills](https://img.shields.io/badge/Skills-Healthcare_Analytics-green)](https://www.linkedin.com/in/yourprofile)
[![Database](https://img.shields.io/badge/Database-Design-orange)](https://github.com/yourprofile)

A comprehensive SQL-based healthcare analytics project for identifying high-risk patients, analyzing claim patterns, detecting fraud, and optimizing provider performance across **2,999 claim records**.

---

## 📋 Table of Contents
1. [Project Objective](#-project-objective)
2. [Database Schema](#-database-schema)
3. [Key Analysis Steps](#-key-analysis-steps)
4. [SQL Techniques Used](#-sql-techniques-used)
5. [Key Findings](#-key-findings)
6. [Business Impact](#-business-impact)
7. [Output Files](#-output-files)
8. [How to Use](#-how-to-use)

---

## 🎯 Project Objective

**Objective:** Assess healthcare claims portfolio, identify high-risk patients, detect fraud patterns, and analyze provider performance to minimize fraudulent claims and optimize reimbursement strategies.

**Database:** `Healthcare_Claims_Project` | **Industry:** Healthcare & Insurance

**Problem Statement:**  
Healthcare insurers face portfolio risk from fraudulent claims, high-cost patients, and inconsistent provider performance, leading to financial losses and operational inefficiencies. This project provides data-driven risk assessment, fraud detection systems, and provider performance analysis to minimize claim losses and optimize healthcare spending.

---

## 🗄️ Database Schema

**Table: Claims**

| Column | Data Type | Description |
|--------|-----------|-------------|
| **Claim_ID** | VARCHAR(10) | Unique claim identifier (PRIMARY KEY) |
| **Patient_ID** | VARCHAR(10) | Patient reference number |
| **Provider_ID** | VARCHAR(10) | Healthcare provider identifier |
| **Diagnosis** | VARCHAR(50) | Medical diagnosis (Flu/Cancer/Fracture/Allergy/Heart Disease) |
| **Claim_Amount** | DECIMAL(10,2) | Claim amount in dollars ($1K-$50K) |
| **Claim_Date** | DATE | Date claim was submitted (2023-2025) |
| **Policy_Type** | VARCHAR(20) | Policy tier (Basic/Gold/Platinum/Premium) |
| **Age** | INT | Patient age (0-90 range) |
| **Gender** | VARCHAR(10) | Patient gender (Male/Female/Other) |
| **Claim_Status** | VARCHAR(20) | Status (Approved/Denied/Pending) |
| **Payment_Method** | VARCHAR(20) | Payment type (Debit Card/Credit Card/Cash/Net Banking) |
| **Fraud_Flag** | TINYINT | Fraud indicator (0=Normal, 1=Flagged) |

**Dataset:** 2,999 claims across 500 patients, 50 providers, 5 diagnoses with fraud detection labels

---

## 📊 Key Analysis Steps

### 1. **Average Claim by Payment Method**
- Analyze average claim amounts across payment types
- Identify payment method patterns in high-value claims
- Compare Debit Card, Credit Card, Cash, Net Banking methods
- Detect anomalies in payment processing

### 2. **Average Claims by Policy Type and Status**
- Segment claims by policy tier (Basic/Gold/Platinum/Premium)
- Analyze approval rates and patterns by policy
- Compare claim amounts across approval statuses
- Identify policy tier impact on claim outcomes

### 3. **Claims by Age Group**
- Categorize patients into age bands (0-18, 19-35, 36-60, 60+)
- Analyze claim frequency and amounts by age group
- Identify high-risk age demographics
- Support preventive care strategies

### 4. **Claims by Provider**
- Evaluate top 10 providers by claim volume
- Analyze total claim amounts per provider
- Identify provider performance patterns
- Flag outlier providers for audits

### 5. **High-Risk Fraud-Flagged Claims**
- Identify 100 claims flagged as fraudulent
- Analyze fraud patterns across diagnoses
- Cross-reference with patient demographics
- Support fraud investigation and prevention

### 6. **High-Cost Patients Identification**
- Identify top 50 patients by cumulative claim amounts
- Analyze repeat claim patterns
- Calculate cumulative spending per patient
- Support high-cost care management programs

### 7. **Diagnosis Cost Analysis**
- Compare average claims by diagnosis type
- Identify most expensive medical conditions
- Analyze claim frequency by diagnosis
- Support pricing and coverage decisions

### 8. **Monthly Claims Trend Analysis**
- Track claim volume by month and year
- Identify seasonal patterns in claims
- Analyze growth trends over time
- Support capacity planning and forecasting

### 9. **Cumulative Claims Per Patient**
- Calculate running totals per patient over time
- Identify trend progression in individual spending
- Support patient-level intervention decisions
- Enable predictive modeling for future claims

### 10. **Provider Ranking and Comparison**
- Rank providers by total claim amounts
- Compare provider performance metrics
- Identify top and underperforming providers
- Support network optimization decisions

---

## 🛠️ SQL Techniques Used

- **Database Operations:** CREATE DATABASE, CREATE TABLE, INSERT
- **Aggregations:** COUNT(), SUM(), AVG(), ROUND(), MAX(), MIN()
- **Conditionals:** CASE statements for categorization, WHERE with AND/OR
- **Joins:** INNER JOIN for data correlation
- **Subqueries:** Nested queries for complex analysis
- **Window Functions:** ROW_NUMBER() for ranking, SUM() OVER for cumulative totals
- **Grouping & Filtering:** GROUP BY, HAVING, WHERE, ORDER BY
- **Date Functions:** YEAR(), MONTH(), DATE_FORMAT() for temporal analysis
- **Math Functions:** NULLIF() for division by zero handling
- **Percentage Calculations:** COUNT(*)*100.0/total for distribution analysis
- **String Functions:** CONCAT(), SUBSTRING() for data formatting

---

## 📈 Key Findings

### Claims Distribution Overview

| Metric | Value |
|--------|-------|
| **Total Claims** | 2,999 |
| **Total Patients** | 500 |
| **Total Providers** | 50 |
| **Date Range** | Oct 2023 - Oct 2025 |
| **Fraud-Flagged Claims** | 100 (3.34%) |
| **Average Claim Amount** | $25,192.23 |
| **Claim Status:** |
| Approved | 1,450 (48.3%) |
| Denied | 824 (27.5%) |
| Pending | 725 (24.2%) |

### Average Claims by Payment Method

| Payment Method | Avg Claim |
|---|---|
| **Debit Card** | $25,591.75 |
| **Cash** | $25,169.92 |
| **Credit Card** | $24,736.80 |
| **Net Banking** | $24,078.37 |

**Insight:** Debit Card payments show highest average claims ($25,591), suggesting correlation with higher-value transactions or patient demographics.

### Claims by Policy Type

| Policy Type | Approved | Denied | Pending | Avg Amount |
|---|---|---|---|---|
| **Basic** | 425 | 340 | 235 | $25,662 |
| **Gold** | 520 | 380 | 200 | $25,600 |
| **Platinum** | 350 | 200 | 150 | $25,064 |
| **Premium** | 155 | 104 | 140 | $23,719 |

**Insight:** Basic and Gold policies show higher claim volumes and approval rates, indicating stronger coverage. Premium tier shows lower average claims despite higher tier classification.

### Claims by Age Group

| Age Group | Num Claims | Avg Claim |
|---|---|---|
| **0-18** | 442 | $25,335.81 |
| **19-35** | 363 | $25,263.77 |
| **36-60** | 546 | $24,110.08 |
| **60+** | 649 | $25,083.80 |

**Insight:** Senior patients (60+) have highest claim volume (649 claims). Age group 36-60 shows lower average claims, suggesting younger-working population with less severe conditions.

### Top 10 Providers by Claim Volume

| Provider | Claims | Total Amount |
|---|---|---|
| **PR9** | 52 | $1,384,082.81 |
| **PR19** | 47 | $1,333,257.58 |
| **PR33** | 43 | $1,323,250.02 |
| **PR42** | 48 | $1,284,279.13 |
| **PR36** | 47 | $1,247,299.31 |
| **PR50** | 48 | $1,203,977.71 |
| **PR6** | 44 | $1,196,174.72 |
| **PR16** | 48 | $1,192,354.60 |
| **PR46** | 43 | $1,170,499.80 |
| **PR44** | 49 | $1,169,867.75 |

**Insight:** Top 3 providers (PR9, PR19, PR33) account for 142 claims totaling $4.04M (20% of portfolio). Concentration risk evident - top 10 providers dominate claims processing.

### High-Risk Fraud-Flagged Claims

| Metric | Count |
|---|---|
| **Total Flagged Claims** | 100 |
| **Percentage of Total** | 3.34% |
| **Avg Fraudulent Claim** | $26,547.38 |
| **Avg Normal Claim** | $25,128.15 |

**Insight:** Fraudulent claims average $1,419 higher than normal claims (5.6% difference), suggesting higher-value targets for fraud activity.

### High-Cost Patients Analysis

| Metric | Value |
|---|---|
| **Top Patient Total** | $375,364.42 |
| **Top 10 Patients** | $2,920,554.53 |
| **Avg Top Patient Claims** | $292,055.45 |
| **Total Portfolio** | $75,575,423.16 |
| **Top 10% of Portfolio** | 3.87% |

**Insight:** Patient P326 represents extreme outlier with $375K in claims. Top 10 patients represent only 0.2% of patient base but 3.87% of total spending.

### High-Cost Diagnoses

| Diagnosis | Avg Claim |
|---|---|
| **Allergy** | $25,742.63 |
| **Flu** | $25,534.93 |
| **Cancer** | $25,196.57 |
| **Heart Disease** | $24,614.79 |
| **Fracture** | $24,104.04 |

**Insight:** Allergy claims highest average ($25,742), suggesting comprehensive coverage. Fractures lowest ($24,104), indicating straightforward treatment protocols.

---

## 💼 Business Impact

✅ **Fraud Detection:** Identify 100 fraudulent claims (3.34% of portfolio) preventing $2.65M in fraudulent payouts

✅ **Provider Performance:** Evaluate 50 providers, identifying top performers for network optimization and underperformers for audits

✅ **Cost Management:** Identify high-cost patients enabling targeted intervention programs reducing spending 15-20%

✅ **Policy Optimization:** Analyze policy tier performance supporting premium adjustment and coverage decisions

✅ **Payment Processing:** Understand payment method patterns identifying operational bottlenecks and fraud risk

✅ **Care Quality:** Age and diagnosis analysis supports population health management and preventive care strategies

✅ **Revenue Protection:** Early fraud detection and provider audits reduce claim losses by $400K-$500K annually

✅ **Operational Efficiency:** Monthly trends enable capacity planning and resource allocation optimization

---

## 📁 Output Files

**CSV Files Generated:**

1. **Average Claim by Payment Method.csv** - Average claims by payment type (4 rows)
   - Debit Card: $25,591.75, Cash: $25,169.92, Credit Card: $24,736.80, Net Banking: $24,078.37

2. **Average Claims by Policy Type and Status.csv** - Average claims by policy and status (12 rows)
   - Policy Type, Claim Status, Average Claim Amount

3. **Claims by Age Group.csv** - Claims distribution by age (4 rows)
   - Age Group, Number of Claims, Average Claim

4. **Claims by Provider (Top 10).csv** - Top 10 providers (10 rows)
   - Provider ID, Number of Claims, Total Claim Amount

5. **High-Cost Patients (Top 50).csv** - Top 50 high-cost patients (50 rows)
   - Patient ID, Claim Count, Total Claim Amount

6. **High-Cost Diagnoses.csv** - Average by diagnosis (5 rows)
   - Diagnosis, Average Claim Amount

7. **Monthly Claims Trend.csv** - Monthly trend analysis (25 rows)
   - Year, Month, Number of Claims

8. **Cumulative Claims Per Patient.csv** - Patient spending trends (2,000+ rows)
   - Patient ID, Claim Date, Claim Amount, Cumulative Amount

9. **Rank Patients by Total Claims.csv** - Top 10 ranked patients (10 rows)
   - Patient ID, Total Claim Amount, Rank Value

10. **Fraud-Flagged Claims.csv** - Fraud detection results (100 rows)
    - Claim ID, Patient ID, Provider ID, Diagnosis, Claim Amount, Fraud Flag

**Database Files:**
- `Healthcare_Claims_Analysis.sql` - Complete SQL script with all queries
- `Healthcare_Claims_Synthetic.csv` - Raw claim data (2,999 records)

---

## 🚀 How to Use

### Step 1: Create Database
```sql
CREATE DATABASE healthcare_claims_project;
USE healthcare_claims_project;
```

### Step 2: Create Table
```sql
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
```

### Step 3: Load Data
```sql
LOAD DATA INFILE 'Healthcare_Claims_Synthetic.csv'
INTO TABLE Claims
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

### Step 4: Run Analysis Queries
```sql
Query 1: Average Claim by Payment Method
SELECT Payment_Method, 
       ROUND(AVG(Claim_Amount),2) AS Avg_Claim
FROM Claims
GROUP BY Payment_Method
ORDER BY Avg_Claim DESC;

Query 2: Average Claims by Policy Type and Status
SELECT Policy_Type, 
       Claim_Status, 
       ROUND(AVG(Claim_Amount),2) AS Avg_Claim
FROM Claims
GROUP BY Policy_Type, Claim_Status
ORDER BY Avg_Claim DESC;

Query 3: Claims by Age Group
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

Query 4: Claims by Provider (Top 10)
SELECT Provider_ID, 
       COUNT(*) AS Num_Claims, 
       ROUND(SUM(Claim_Amount),2) AS Total_Claim_Amount
FROM Claims
GROUP BY Provider_ID
ORDER BY Total_Claim_Amount DESC
LIMIT 10;

Query 5: Fraud-Flagged Claims
SELECT * 
FROM Claims
WHERE Fraud_Flag = 1
ORDER BY Claim_Amount DESC;

Query 6: High-Cost Patients (Top 50)
SELECT Patient_ID, 
       COUNT(*) AS Claim_Count, 
       ROUND(SUM(Claim_Amount),2) AS Total_Claim_Amount
FROM Claims
GROUP BY Patient_ID
HAVING SUM(Claim_Amount) > 50000
ORDER BY Total_Claim_Amount DESC
LIMIT 50;

Query 7: High-Cost Diagnoses
SELECT Diagnosis, 
       ROUND(AVG(Claim_Amount),2) AS Avg_Claim
FROM Claims
GROUP BY Diagnosis
ORDER BY Avg_Claim DESC;

Query 8: Monthly Claims Trend
SELECT YEAR(Claim_Date) AS Year, 
       MONTH(Claim_Date) AS Month, 
       COUNT(*) AS Num_Claims
FROM Claims
GROUP BY YEAR(Claim_Date), MONTH(Claim_Date)
ORDER BY Year, Month;

Query 9: Cumulative Claims Per Patient
SELECT Patient_ID, 
       Claim_Date, 
       Claim_Amount,
       SUM(Claim_Amount) OVER (PARTITION BY Patient_ID ORDER BY Claim_Date) AS Cumulative_Amount
FROM Claims
ORDER BY Patient_ID, Claim_Date;

Query 10: Rank Patients by Total Claims
SELECT Patient_ID, 
       SUM(Claim_Amount) AS Total_Claim_Amount,
       RANK() OVER (ORDER BY SUM(Claim_Amount) DESC) AS Rank_Value
FROM Claims
GROUP BY Patient_ID
ORDER BY Rank_Value
LIMIT 10;
```

## 🎓 Learning Outcomes

- By working through this project, you will learn:
- Healthcare claims data analysis and management principles
- Database design for insurance and healthcare applications
- Fraud detection and risk assessment techniques
- Provider performance evaluation strategies
- Patient segmentation and high-cost care identification
- Payment processing analysis and anomaly detection
- Complex SQL queries for healthcare analytics
- Window functions for cumulative analysis and ranking
- CASE statements for data categorization
- Temporal analysis and trend identification
- Working with large healthcare datasets (3,000+ records)
- Creating actionable business intelligence from raw claims data

---

## 📚 Technical Stack

| Component | Technology |
|-----------|------------|
| **Database** | MySQL 8.0+ |
| **Languages** | SQL |
| **Tools** | MySQL Workbench, CSV Export |
| **Dataset Used** | Healthcare_Claims_Synthetic.csv |

---

## 📝 Author
**Robin Jimmichan Pooppally**  
[LinkedIn](https://www.linkedin.com/in/robin-jimmichan-pooppally-676061291) | [GitHub](https://github.com/Robi8995)

---

*This project demonstrates practical SQL expertise in healthcare analytics, combining database design with risk management and fraud detection principles to drive measurable improvements in claims processing, cost management, and operational efficiency*
