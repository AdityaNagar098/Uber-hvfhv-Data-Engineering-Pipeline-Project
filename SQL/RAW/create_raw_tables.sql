-- RAW layer table creation (schema inferred from Parquet)
-- Data loaded from NYC TLC HVFHV Parquet files into Snowflake RAW schema

-- task:- Create Database for the Project
--sql code:-
-- CREATE DATABASE UBER_ANALYTICS;

-- task:- Create Schema (Organize Tables)

-- sqlcode:-
-- USE DATABASE UBER_ANALYTICS;
-- CREATE SCHEMA RAW;
-- CREATE SCHEMA SILVER;
-- CREATE SCHEMA GOLD;

-- task:-Verify Database & Schemas (Quick Check)

-- sql code:- 
SHOW DATABASES;

USE DATABASE UBER_ANALYTICS;
SHOW SCHEMAS;


