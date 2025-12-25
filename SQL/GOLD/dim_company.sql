-- =========================================================
-- GOLD LAYER: COMPANY DIMENSION
-- =========================================================

USE DATABASE UBER_ANALYTICS;
USE SCHEMA GOLD;

CREATE OR REPLACE TABLE DIM_COMPANY AS
SELECT DISTINCT
    hvfhs_license_num AS company_id,
    CASE
        WHEN hvfhs_license_num = 'HV0003' THEN 'Uber'
        WHEN hvfhs_license_num = 'HV0005' THEN 'Lyft'
        ELSE 'Other'
    END AS company_name
FROM SILVER.HVFHV_TRIPS_CLEAN;
