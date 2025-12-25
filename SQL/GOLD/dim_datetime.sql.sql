-- =========================================================
-- GOLD LAYER: DATETIME DIMENSION
-- =========================================================

USE DATABASE UBER_ANALYTICS;
USE SCHEMA GOLD;

CREATE OR REPLACE TABLE DIM_DATETIME AS
SELECT DISTINCT
    pickup_ts                              AS datetime_id,
    DATE(pickup_ts)                        AS date,
    EXTRACT(hour FROM pickup_ts)           AS hour,
    EXTRACT(day FROM pickup_ts)            AS day,
    EXTRACT(month FROM pickup_ts)          AS month,
    EXTRACT(year FROM pickup_ts)           AS year,
    DAYNAME(pickup_ts)                     AS day_name,
    CASE
        WHEN DAYOFWEEK(pickup_ts) IN (1, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type
FROM SILVER.HVFHV_TRIPS_CLEAN;
