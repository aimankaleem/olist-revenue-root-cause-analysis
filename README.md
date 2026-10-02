# E-Commerce Revenue Drop Root Cause Analysis (RCA)

An end-to-end data analytics project investigating platform revenue contraction on 100k+ Brazilian e-commerce orders (Olist dataset) using MySQL and Python.



## Executive Summary
Between May 2018 and June 2018, platform revenue experienced a sharp **12.4% contraction**, dropping from **$977,544.69** down to **$856,077.86** (-$121.5k). 

A structured Root Cause Analysis demonstrated that this drop was **volume-driven** (-9.6% delivered orders), not basket-size driven (AOV remained stable at ~$140–$144). The underlying cause was traced to severe logistical fulfillment bottlenecks in Q1 2018—where delivery delay rates peaked at **21.36% in March 2018**—triggering a 60–90 day customer churn wave that suppressed mid-2018 order volume.

---

## Tech Stack & Skills
- **Database Engine:** MySQL Server 8.0, MySQL Workbench
- **Query Techniques:** Common Table Expressions (CTEs), Conditional Aggregation (`CASE WHEN`), Date Arithmetic (`DATEDIFF`), Window Joins
- **Data Ingestion:** Python (`pandas`, `sqlalchemy`, `mysql-connector-python`)

---

## Repository Structure
├── sql/
│   ├── 01_monthly_revenue_trend.sql    # Milestone 1: Revenue & AOV De
│   ├── 02_logistics_lead_times.sql     # Milestone 2: Fulfillment & De
│   └── 03_category_shift_analysis.sql  # Milestone 3: Category Loss Ranking
├── data/
│   ├── milestone1.csv                  # Monthly orders, revenue, and 
│   ├── milestone2.csv                  # Transit durations and delay %
│   └── milestone3.csv                  # Category delta comparisons (May vs Jun)
├── load_data.py                        # Automated bulk loader into M
└── README.md