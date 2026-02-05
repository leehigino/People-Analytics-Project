# People Analytics Project — Turnover and Attrition Risk Analysis

![Analytics](https://img.shields.io/badge/Área-People_Analytics-8A2BE2)
![Python](https://img.shields.io/badge/Analysis-Pandas-yellowgreen)
![SQL](https://img.shields.io/badge/Database-PostgreSQL-blue)
![BI](https://img.shields.io/badge/Visualization-Power_BI-yellow)

## Overview

This project aims to analyze the factors associated with employee turnover and to map attrition risk (Turnover Risk) using a data-driven approach. The analysis combines SQL, Python, and Power BI, focusing on transforming Human Resources data into actionable insights for strategic decision-making.

The project was developed as part of a professional portfolio, simulating a real-world People Analytics scenario within an organization.


## Objectives

* Identify patterns and critical factors associated with turnover.

* Classify employees by level of attrition risk.

* Evaluate the impact of variables such as:

	* Job role and hierarchical level 
	* Monthly income
	* Company tenure
	* Satisfaction and engagement indicators

* Develop clear and informative executive dashboards in Power BI.

## Business Questions

1. Which employee profiles present the highest attrition risk?
2. Is there a correlation between monthly income and turnover probability?
3. Do specific hierarchical levels concentrate higher risk?
4. How can retention actions be prioritized based on evidence?

## Project Structure

projeto-RH/

├── data/

│   ├── data_raw.csv

│   ├── analise.ipynb

│   └── data_processed.csv

├── sql/

│   ├── 01_create_staging.sql

│   ├── 02_create_views.sql

│   └── 03_analysis_queries.sql

├── dashboard/

│   └── hr_analytics.pbix

├── images/

└── README.md


## Tools and Technologies

Database: PostgreSQL (data modeling and queries)

Data Analysis: Python (Pandas, exploratory analysis)

Visualization: Power BI

Version Control: Git & GitHub

## Modeling and Metrics

**Turnover Risk Score**

A composite score was developed to quantify turnover risk on a scale from 0 to 100, where higher values indicate greater risk.


**Risk Classification**

Based on the continuous score, employees were categorized into three levels to facilitate interpretation and communication with stakeholders:

1. Low Risk
2. Medium Risk
3. High Risk


## Dashboard (Power BI)

Two interactive dashboards were developed, each with a specific strategic focus:

**Executive View (Historical Analysis)**

* Focus on analyzing realized turnover.
* Key KPIs: Total employees, total turnover, turnover rate, average risk score, number of high-risk employees.
* Main visuals: Turnover distribution by department, job role, and hierarchical level (Job Level). Demographic analysis by age, tenure, and income band.

**Proactive View (Risk Analysis)**

* Focus on identifying and prioritizing future risks.
* Key KPIs: Average turnover risk score, count of high-risk employees, job satisfaction and work-life balance percentages.
* Main visuals: Analysis of tenure and time since last promotion. Potential financial impact (income and stock options). Correlation matrix between satisfaction and work-life balance. Detailed table listing high-risk employees, including age, job role, and score.

## Key Insights

1. Executive View (Historical Analysis)

Turnover is concentrated in the Sales, Human Resources (HR), and Research & Development (R&D) departments.
Within these departments, the roles of Sales Representative, Research Scientist, and Laboratory Technician show the highest attrition rates.
The predominant historical turnover profile consists of employees under 30 years old, with less than one year of tenure and a monthly income below 3k.

2. Proactive View (Risk Analysis)

The company’s average risk score falls within the Medium category.
Risk drivers reinforce historical trends: short tenure (Tenure < 1 year) and lower income bands.
A new significant risk factor was identified: long time since last promotion.
Low job satisfaction and poor work-life balance are strong risk indicators, and the combination of both factors exponentially increases the likelihood of attrition.

## Next Steps

* Incorporate new predictive variables, such as engagement data and continuous feedback.
* Develop a predictive turnover model using Machine Learning techniques.
* Evolve the architecture toward an automated data pipeline, integrating new data sources and periodic updates.

## About the Project

This project was developed with a focus on hands-on learning, applying People Analytics concepts, and building a solid Data portfolio.

Feel free to explore the repository, suggest improvements, or get in touch to discuss the topic.
