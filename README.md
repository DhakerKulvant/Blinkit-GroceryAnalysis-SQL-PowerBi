# Blinkit Grocery Analysis - SQL & Power BI Dashboard

[![SQL](https://img.shields.io/badge/SQL-MySQL-blue)](https://www.mysql.com/) 
[![Power BI](https://img.shields.io/badge/Power%20BI-Visualization-orange)](https://powerbi.microsoft.com/) 
[![Python](https://img.shields.io/badge/Python-Data%20Processing-brightgreen)](https://www.python.org/) 
[![Dataset](https://img.shields.io/badge/Dataset-CSV-red)](data/raw_data.csv)

![Dashboard Preview](images/blinkit_dashboard.jpg)

---

## 📋 Table of Contents
- [Project Overview](#-project-overview)  
- [Business Objectives](#-business-objectives)  
- [Key Performance Indicators (KPIs)](#-key-performance-indicators-kpis)  
- [Analysis Requirements](#-analysis-requirements)  
- [Technologies Used](#-technologies-used)  
- [Dataset Information](#-dataset-information)  
- [Data Cleaning Process](#-data-cleaning-process)  
- [Dashboard Features](#-dashboard-features)  
- [Key Insights](#-key-insights)  
- [Project Structure](#-project-structure)  
- [Getting Started](#-getting-started)  
- [Business Recommendations](#-business-recommendations)  
- [Future Enhancements](#-future-enhancements)  
- [Author](#-author)  

---

## 📊 Project Overview

This project provides a detailed analysis of **Blinkit** (India's Last Minute App) sales performance, customer satisfaction, and inventory distribution. Using **SQL** for data cleaning and **Power BI** for visualization, the project delivers actionable insights for operational and strategic decision-making.

---

## 🎯 Business Objectives

- Analyze sales performance, customer satisfaction, and inventory distribution.  
- Identify insights and optimize operations using KPIs and interactive dashboards.  

---

## 📈 Key Performance Indicators (KPIs)

| KPI | Value |
| --- | --- |
| Total Sales | $1.20M overall revenue |
| Average Sales | $141 per transaction |
| Number of Items | 8,523 |
| Average Rating | 3.9 / 5 |

---

## 🔍 Analysis Requirements

### Primary Metrics
1. **Total Sales by Fat Content** – Compare low-fat vs. regular items  
2. **Total Sales by Item Type** – Category-wise performance  
3. **Fat Content by Outlet** – Outlet segmentation analysis  
4. **Total Sales by Outlet Establishment Year** – Impact of outlet age  

### Visual Analytics
5. **Sales by Outlet Size** – Outlet size vs. sales correlation  
6. **Sales by Outlet Location** – Geographic distribution (Tier 1/2/3)  
7. **Comprehensive Outlet Type Metrics** – KPIs by outlet type  

---

## 🛠️ Technologies Used

- **SQL Workbench** – Data cleaning & transformation  
- **Power BI** – Dashboard & visualization  
- **MySQL** – Database management  
- **Python** – Optional preprocessing and ETL tasks  

---

## 📋 Dataset Information

### Sample Data Structure
Item Fat Content | Item Identifier | Item Type | Outlet Establishment Year | Outlet Location Type | Outlet Size | Total Sales | Rating

### Key Data Fields
- **Item Fat Content** – Low Fat / Regular  
- **Item Type** – 16 categories (Fruits, Snack Foods, etc.)  
- **Outlet Establishment Year** – 1985–2022  
- **Outlet Location Type** – Tier 1, 2, 3  
- **Outlet Size** – Small, Medium, Large  
- **Outlet Type** – Grocery Store, Supermarket Type1/2/3  

---

## 🔧 Data Cleaning Process

### SQL Examples
```sql
-- Standardize Fat Content
UPDATE blinkitgrocerydata
SET `Item Fat Content` = 
    CASE 
        WHEN `Item Fat Content` IN ('LF', 'low fat') THEN 'Low Fat'
        WHEN `Item Fat Content` = 'reg' THEN 'Regular'
        ELSE `Item Fat Content`
    END;

-- Total Sales in Millions
SELECT CAST(SUM(`Total Sales`) / 1000000.0 AS DECIMAL(10,2)) AS `Total Sales Million`
FROM blinkitgrocerydata;

-- Average Sales
SELECT CAST(AVG(`Total Sales`) AS INT) AS `Avg Sales`
FROM blinkitgrocerydata;

## 📊 Dashboard Features

### Filters
- **Outlet Location Type** – All / Tier 1 / Tier 2 / Tier 3  
- **Outlet Size** – All / Small / Medium / Large  
- **Item Type** – All available  

### Visualizations
1. **KPI Cards** – Total Sales, Avg Sales, Items Count, Avg Rating  
2. **Donut Chart** – Low Fat vs Regular items  
3. **Horizontal Bar** – Item type performance  
4. **Outlet Analysis** – Fat content by outlet  
5. **Time Series** – Outlet establishment years  
6. **Geographic Map** – Sales by tier  
7. **Metrics Table** – KPIs by outlet type  

---

## 🎨 Key Insights

### Top Categories
- **Fruits & Vegetables** – $0.18M  
- **Snack Foods** – $0.18M  
- **Household Items** – $0.14M  

### Outlet Performance
- **Supermarket Type1** – $787.55K sales  
- **Tier 3 Locations** – $472.13K sales  
- **Medium-Sized Outlets** – Optimal performance  

### Customer Satisfaction
- **Average rating**: 4.0 across all outlets  
- **High item visibility**: 0.06–0.10  

---

## 📁 Project Structure
Blinkit-GroceryAnalysis-SQL-PowerBi/
│
├── data/
│   ├── raw_data.csv
│   └── cleaned_data.csv
│
├── sql_queries/
│   └── data_cleaning_queries.sql
│
├── powerbi/
│   └── blinkit_dashboard.pbix
│
├── images/
│   ├── blinkit_dashboard.jpg
│   ├── background.png
│   ├── rating.png
│   ├── items.png
│   ├── avgSales.png
│   └── Sales.png
│
└── README.md

## 🚀 Getting Started

### Clone Repository
``bash
git clone https://github.com/DhakerKulvant/Blinkit-GroceryAnalysis-SQL-PowerBi.git

## 🚀 Database Setup & Power BI

### Database Setup
1. Import the dataset into **MySQL Workbench**  
2. Run SQL data cleaning queries  

### Power BI
1. Open the `.pbix` file in **Power BI Desktop**  
2. Connect to the cleaned dataset  
3. Refresh data  

---

## 💡 Business Recommendations

- **Focus on Tier 3 markets** – Highest performing segment  
- **Optimize product mix** – Prioritize Fruits & Vegetables and Snacks  
- **Leverage medium-sized outlets** – Best balance of performance and efficiency  
- **Implement Fat Content Strategy** – Promote low-fat options


## 👨‍💻 Author

**Kulvant Dhaker**  
*Data Analyst*

- 📧 **Email**: dhakerkulvant@gmail.com
- 💼 **LinkedIn**: [linkedin.com/in/dhakerkulvant01](https://www.linkedin.com/in/dhakerkulvant01)
- 🔗 **GitHub**: [github.com/DhakerKulvant](https://github.com/DhakerKulvant)

*Transforming data into actionable business insights*

---
