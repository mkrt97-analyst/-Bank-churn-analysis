# -Bank-churn-analysis

A complete end-to-end data analysis project built to identify why bank customers leave and
what the business can do about it.
 
# Tools Used
Tool
Purpose
Excel
First look at data, pivot tables, churn rate by country & age group
MySQL
Business queries — churn by country, active vs inactive, products
Python
Visualizations — age histogram, correlation heatmap
Power BI
2-page interactive dashboard with slicers and KPI cards

📂 Project Structure
customer-churn-analysis/
├
── data/
│   └── churn_dataset.csv              
├
── sql/
│   └── churn_business_queries.sql     
├
── python/
│   └── churn_visualizations.ipynb     
├
── powerbi/
│   └── churn_dashboard.pbix           
└── README.md
← cleaned dataset (10,000 rows, 15 columns)
← all MySQL queries with comments
← Jupyter notebook with charts
← 2-page Power BI dashboard

# Dataset
Source:
Bank Customer Churn Prediction — Kaggle
Size: 10,000 customers, 15 columns
Target column:
Exited (1 = churned, 0 = stayed)
Key columns used:
Column
Description
Geography
Customer country (France, Germany, Spain)
Age
Customer age
Balance
Account balance
NumOfProducts
Number of bank products held
IsActiveMember
Active (1) or Inactive (0)
Exited
Churned (1) or Stayed (0) — target variable

# Phase 1 — Excel Analysis
What I did:
Opened the dataset and explored 10,000 rows
Used 
AVERAGE(Exited)*100 formula to calculate overall churn rate → 20.37%
Created Pivot Tables to find churn rate by Country and Age Group
Made bar charts from pivot tables
Key finding from Excel:
Germany churn rate (~32%) was double France and Spain (~16%) — spotted before writing
a single line of code

# Phase 2 — MySQL Queries
What I did:
Created a database 
churn_db and imported the CSV
Wrote 5 business queries to answer specific questions
Query 1 — Total customers and churned count:
sql
SELECT
COUNT(*) AS total_customers,
SUM(Exited) AS total_churned
FROM Churn_Modelling;
Query 2 — Churn rate by country:
sql
SELECT Geography AS country,
COUNT(*) AS total,
ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM Churn_Modelling
GROUP BY Geography
ORDER BY churn_rate DESC;
Query 3 — Active vs Inactive churn:
SELECT
CASE WHEN IsActiveMember = 1 THEN 'Active' ELSE 'Inactive' END AS member_status,
COUNT(*) AS total,
ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM Churn_Modelling
GROUP BY IsActiveMember;
Query 4 — Churn by number of products:
SELECT NumOfProducts AS products_held,
COUNT(*) AS total_customers,
ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM Churn_Modelling
GROUP BY NumOfProducts
ORDER BY NumOfProducts;
Query 5 — German customers by gender:
SELECT Gender,
COUNT(*) AS total,
ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_percent
FROM Churn_Modelling
WHERE Geography = 'Germany'
GROUP BY Gender;

# Phase 3 — Python Visualizations
Libraries used:
pandas , 
matplotlib , 
What I built:
seaborn
Chart 1 — Age distribution by churn status
python
sns.histplot(data=df, x='Age', hue='Exited', bins=30,
palette={0: '#1D9E75', 1: '#D85A30'})
Shows that churned customers are mostly aged 40–60.
Chart 2 — Correlation heatmap
python
sns.heatmap(df[number_cols].corr(), annot=True, fmt='.2f',
cmap='RdYlGn', center=0)
Shows Age has the strongest positive correlation with churn. IsActiveMember has a negative
correlation — active members churn less.

# Phase 4 — Power BI Dashboard
2-page interactive dashboard built in Power BI Desktop
Page 1 — Overview
4 Slicers: Geography, Gender, AgeGroup, ActiveMember
4 KPI Cards: Total Customers, Churned Customers, Churn Rate %, Retention Rate %
Donut chart: Stayed vs Churned
Bar chart: Churn rate by Country
Bar chart: Churn rate by Age Group
Bar chart: Active vs Inactive churn
Page 2 — Deep Dive
Column chart: Average Balance — Stayed vs Churned
Bar chart: Churn rate by Number of Products
Bar chart: Churn rate by Gender
Bar chart: Churn rate by Credit Score Group
Key findings text box
DAX Measures created:
Churned Customers = CALCULATE(COUNTROWS(Churn_Modelling), Churn_Modelling[Exited]
= 1)
Churn Rate % = DIVIDE([Churned Customers], COUNTROWS(Churn_Modelling), 0) * 100
Retention Rate % = 100 - [Churn Rate %]

# Key Findings
1. Germany has the highest churn rate (32%) — double France and Spain (16%)
2. Customers aged 46–60 churn the most — over 50% in this age group left
3. Inactive members churn at 2x the rate of active members (27% vs 14%)
4. Customers with 3–4 products have the highest churn (83–100%) — more products does
NOT mean more loyalty

# Business Recommendations
Based on the analysis, I recommend 3 actions:
1. Launch a re-engagement campaign for inactive German customers — highest risk
segment, highest ROI for retention
2. Create age-specific retention offers for the 46–60 segment — priority group with 50%+
churn
3. Review the product bundling strategy — customers with 3+ products are churning at
alarming rates, suggesting product overload or mismatch

# How to Run This Project
SQL:
1. Install MySQL Workbench (free at mysql.com)
2. Run 
Python:
churn_business_queries.sql to create the database and run all queries
1. Install Anaconda (free at anaconda.com)
2. Open 
churn_visualizations.ipynb in Jupyter Notebook
3. Update the file path on line 2 to your local CSV location
4. Run each cell with Shift + Enter
Power BI:
1. Install Power BI Desktop (free at powerbi.microsoft.com)
2. Open 
churn_dashboard.pbix

# About
Hi, I am M K ROHIT a fresher seeking a data analyst role.
This project was built to demonstrate end-to-end analytics skills using
real business data.

📧 [mkrohit1997@gmail.com]
💼 [linkedin.com/in/mkrt]
 
