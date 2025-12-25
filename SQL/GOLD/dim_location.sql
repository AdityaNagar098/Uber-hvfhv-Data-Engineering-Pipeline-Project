-- =========================================================
-- GOLD LAYER: LOCATION DIMENSION
-- =========================================================

USE DATABASE UBER_ANALYTICS;
USE SCHEMA GOLD;

CREATE OR REPLACE TABLE DIM_LOCATION AS
SELECT DISTINCT
    pickup_location_id AS location_id
FROM SILVER.HVFHV_TRIPS_CLEAN

UNION

SELECT DISTINCT
    dropoff_location_id AS location_id
FROM SILVER.HVFHV_TRIPS_CLEAN;
