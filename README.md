# Uber hvfhv Data Engineering Pipeline Project

## 1. Introduction

This project demonstrates an end-to-end data engineering pipeline built using NYC TLC High Volume For-Hire Vehicle (HVFHV) trip data (Uber/Lyft).

The objective of the project is to ingest raw trip data, perform data cleaning and transformation, apply dimensional modeling, and create analytics-ready datasets using Snowflake and SQL.

The pipeline follows a layered data architecture (RAW → SILVER → GOLD) to ensure data quality, scalability, and ease of analytics.
This project is designed as a portfolio project for a Data Engineering Intern role.

## 2. Architecture

The pipeline follows a modern analytics architecture:

![Uber Data Architecture](./data%20Architecture.png)
---

## Layer Description

### RAW (Bronze)
Stores raw Parquet data exactly as ingested from the source without any modification.

### SILVER
Applies data cleaning, timestamp normalization, validation checks, and derives core trip-level metrics.

### GOLD
Implements a **star schema** with fact and dimension tables and exposes business metrics through SQL views for analytics and reporting.

---

## 3. Technology Used

### Data Warehouse
- Snowflake

### Data Processing & Transformation
- SQL

### Data Format
- Parquet

### Data Modeling
- Star Schema (Fact & Dimension tables)

### Optional / Future Enhancements
- Pipeline orchestration using Mage or Airflow  
- Dashboard using Looker Studio or Streamlit  
- Incremental data loading  

## 4. Dataset Used

**Dataset:** NYC TLC High Volume For-Hire Vehicle (HVFHV) Trip Records  
**Source:** NYC Taxi & Limousine Commission (TLC)  
**Format:** Parquet  

### Dataset Description

The dataset contains trip-level data for high-volume for-hire vehicles such as **Uber and Lyft**, including:

- Pickup and dropoff timestamps  
- Pickup and dropoff locations  
- Trip distance and duration  
- Fare amounts and driver payments  

### Official dataset link:  
https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page

## Key Features

- Ingested multi-million-row Parquet datasets into Snowflake
- Performed data profiling and quality checks
- Built a SILVER layer with validated timestamps and cleaned metrics
- Designed a STAR schema with FACT and DIM tables
- Created analytics-ready GOLD views for business insights

## Star Schema Overview

### Fact Table

- FACT_TRIPS

### Dimension Tables

- DIM_DATETIME
- DIM_LOCATION
- DIM_COMPANY

### Business Metrics (GOLD Views)

- Trips & revenue by hour
- Daily revenue trends
- Company market share (Uber vs Lyft)
- Weekday vs weekend demand
- Driver pay efficiency

## Summary

This project focuses on data engineering fundamentals such as ingestion, transformation, modeling, and analytics readiness.
The pipeline is scalable, modular, and can be easily extended with orchestration or dashboards.

## 📌 Author

### Aditya Nagar
