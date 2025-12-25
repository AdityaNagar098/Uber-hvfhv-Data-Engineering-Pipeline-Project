-- =========================================================
-- GOLD LAYER: FACT TABLE
-- =========================================================
-- Table: FACT_TRIPS
-- Grain: One row per HVFHV trip
-- =========================================================

USE DATABASE UBER_ANALYTICS;
USE SCHEMA GOLD;

CREATE OR REPLACE TABLE FACT_TRIPS AS
SELECT
    /* Foreign keys */
    pickup_ts               AS datetime_id,
    pickup_location_id      AS pickup_location_id,
    dropoff_location_id     AS dropoff_location_id,
    hvfhs_license_num       AS company_id,

    /* Measures */
    trip_miles,
    trip_duration_minutes,
    total_amount,
    driver_pay
FROM SILVER.HVFHV_TRIPS_CLEAN;
