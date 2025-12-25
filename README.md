# Uber hvfhv Data Engineering Pipeline Project

## 1. Introduction

This project demonstrates an end-to-end data engineering pipeline built using NYC TLC High Volume For-Hire Vehicle (HVFHV) trip data (Uber/Lyft).

The objective of the project is to ingest raw trip data, perform data cleaning and transformation, apply dimensional modeling, and create analytics-ready datasets using Snowflake and SQL.

The pipeline follows a layered data architecture (RAW → SILVER → GOLD) to ensure data quality, scalability, and ease of analytics.
This project is designed as a portfolio project for a Data Engineering Intern role.

## 2. Architecture

The pipeline follows a modern analytics architecture:

NYC TLC HVFHV Parquet Files
        ↓
Local Storage
        ↓
Snowflake RAW (Bronze Layer)
        ↓
Snowflake SILVER (Cleaned & Standardized Data)
        ↓
Snowflake GOLD (Star Schema & Business Metrics)


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

Official dataset link:  
https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page
