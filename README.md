# E-Commerce Operations & Customer Analytics 

## Overview

This project delivers a complete end-to-end Business Intelligence solution built using Python, SQL Server, Power BI, and DAX.

The project transforms raw Brazilian e-commerce transactional data from the Olist dataset into an analytical model capable of tracking sales performance, customer behavior, product performance, seller contribution, and delivery operations.

The solution covers the entire analytics lifecycle including data preparation, data modeling, SQL analysis, KPI development, and interactive dashboard reporting.

---

## Business Problem

E-commerce companies generate massive amounts of transactional data across orders, customers, products, payments, sellers, and deliveries.

Business stakeholders need a centralized analytical solution that enables them to:

- Monitor revenue performance
- Analyze customer behavior
- Evaluate product and seller performance
- Measure delivery efficiency
- Track customer satisfaction
- Support data-driven decision making

---

## Solution

The project was developed using a complete analytics workflow:

## Data Preparation with Python

Python was used to prepare and transform the raw Olist datasets before loading them into SQL Server.

Tasks performed:

- Data Cleaning
- Handling Missing Values
- Merging Multiple Datasets
- Revenue Calculation
- Delivery Metrics Creation
- Date Transformation

Datasets used:

- Orders
- Order Items
- Payments
- Reviews
- Customers
- Products
- Sellers

Generated fields:

- total_revenue
- delivery_days
- delay_days
- payment_type
- payment_value
- review_score

Libraries:

- Pandas
- NumPy

The final analytical dataset was exported and loaded into SQL Server for further analysis and dashboard development.
---

### SQL Server

SQL Server was used for:

- Data Storage
- Star Schema Modeling
- Business Analysis
- KPI Validation

SQL concepts applied:

- Aggregations
- GROUP BY
- HAVING
- Subqueries
- Common Table Expressions (CTE)
- Window Functions
- Ranking Functions

---

## Data Model

The project follows a Star Schema architecture.

### Fact Table

- FactSales

### Dimension Tables

- DimCustomers
- DimProducts
- DimSellers
- DimDate

This structure enables scalable reporting, fast filtering, and efficient analytical calculations.

---

## Power BI Dashboards

### 1. Executive Overview

Provides a high-level view of business performance.

KPIs:

- Total Revenue
- Total Orders
- Total Customers
- Total Sellers
- Average Delivery Days
- Average Review Score
- Delayed Orders %

Visualizations:

- Monthly Revenue Trend
- Revenue by Payment Method
- Top States by Revenue

---

### 2. Sales Performance

Analyzes sales and seller performance.

KPIs:

- Total Revenue
- Product Revenue
- Total Freight Revenue
- Freight Revenue %

Visualizations:

- Top Categories by Revenue
- Revenue by Seller State
- Average Order Value by State
- Product Revenue vs Freight Trend

---

### 3. Customer & Product Intelligence

Analyzes customer behavior and product performance.

KPIs:

- Total Customers
- Average Review Score
- Total Products
- Revenue per Customer

Visualizations:

- Top Products by Revenue
- Revenue by Category
- Customers by State
- Product Performance Matrix

---

### 4. Delivery Analytics

Focuses on logistics and customer satisfaction.

KPIs:

- Average Delivery Days
- Delayed Orders %
- Average Review Score
- Delivered Orders

Visualizations:

- Delivery Days Distribution
- Order Status Breakdown
- Average Delivery Days by State
- Review Score Distribution

---

## DAX Measures

Custom DAX measures developed:

- Total Revenue
- Total Orders
- Total Customers
- Total Sellers
- Total Products
- Product Revenue
- Revenue per Customer
- Revenue per Seller
- Average Delivery Days
- Average Review Score
- Delayed Orders %
- Delivered Orders
- Freight Revenue %
- Average Order Value

---

## Key Insights

### Sales Performance

- Revenue exceeded $16M across the analyzed period.
- Credit cards represented the dominant payment method.
- Product revenue contributed the majority of overall revenue.

### Product Analysis

- Bed Bath Table generated the highest revenue among product categories.
- Revenue distribution was highly concentrated among a small number of categories.
- Product performance varied significantly across categories.

### Customer Analysis

- Customer activity was heavily concentrated in a small group of Brazilian states.
- Average customer review scores remained above 4 out of 5.
- Revenue per customer remained relatively stable across years.

### Delivery Analysis

- Most orders were delivered within two weeks.
- Delayed orders represented a relatively small percentage of total orders.
- Longer delivery periods were associated with lower customer satisfaction in several regions.

---

## Tools & Technologies

- Python
- Pandas
- SQL Server
- Power BI
- DAX
- Data Modeling
- Star Schema
- Business Intelligence
- Data Visualization

---

## Repository Structure

```text
Olist-End-to-End-ECommerce-Analytics
│
├── Olist-ECommerce-Analytics.pbix
│
├── SQL
│   └── Olist_SQL_Analysis.sql
│
├── Screenshots
│   ├── 01_Executive_Overview.png
│   ├── 02_Sales_Performance.png
│   ├── 03_Customer_Product_Intelligence.png
│   ├── 04_Delivery_Analytics.png
│   └── 05_Data_Model.png
│
└── README.md
```

---

## Author

Mohamed Afify

Data Analyst | Power BI Developer | SQL Analyst | Python 
