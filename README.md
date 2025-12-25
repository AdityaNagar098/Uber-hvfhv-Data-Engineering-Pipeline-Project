# Uber hvfhv Data Engineering Pipeline Project
Built an end-to-end data analytics pipeline using NYC TLC HVFHV trip data. The project demonstrates data ingestion, cleaning, modeling, and analytics using Snowflake and SQL.

Tech Stack

Snowflake (Data Warehouse)

SQL (Transformations & Modeling)

Parquet (Source data)

Pipeline Architecture
TLC HVFHV Parquet
      ↓
Snowflake RAW (Bronze)
      ↓
Snowflake SILVER (Cleaned & standardized)
      ↓
Snowflake GOLD (Star schema & analytics views)


Key Features

Ingested multi-million-row Parquet datasets

Performed data profiling and quality checks

Built SILVER layer with validated timestamps and metrics

Designed a STAR schema (FACT + DIM tables)

Created analytics-ready GOLD views for business insights

Future Enhancements

Add orchestration using Mage or Airflow

Build dashboards using Looker Studio or Streamlit

Implement incremental loading
