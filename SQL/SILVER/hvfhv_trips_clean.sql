-- =========================================================
-- SILVER LAYER: Cleaned & Standardized HVFHV Trips
-- =========================================================
-- Purpose:
-- 1. Normalize timestamps
-- 2. Resolve duplicate location columns
-- 3. Remove invalid trips
-- 4. Create analytics-ready trip metrics
-- =========================================================

USE DATABASE UBER_ANALYTICS;
USE SCHEMA SILVER;

CREATE OR REPLACE TABLE HVFHV_TRIPS_CLEAN AS
SELECT
    /* Identifiers */
    "hvfhs_license_num"      AS hvfhs_license_num,
    "dispatching_base_num"   AS dispatching_base_num,

    /* Canonical pickup & dropoff locations */
    "PULocationID"           AS pickup_location_id,
    "DOLocationID"           AS dropoff_location_id,

    /* Timestamp normalization (milliseconds → timestamp) */
    TO_TIMESTAMP_NTZ("pickup_datetime" / 1000)  AS pickup_ts,
    TO_TIMESTAMP_NTZ("dropoff_datetime" / 1000) AS dropoff_ts,

    /* Trip metrics */
    "trip_miles"             AS trip_miles,
    "trip_time"              AS trip_time,

    /* Fare components */
    "base_passenger_fare"    AS base_passenger_fare,
    "tips"                   AS tips,
    "tolls"                  AS tolls,
    "sales_tax"              AS sales_tax,
    "bcf"                    AS bcf,
    "congestion_surcharge"   AS congestion_surcharge,
    "airport_fee"            AS airport_fee,
    "cbd_congestion_fee"     AS cbd_congestion_fee,
    "driver_pay"             AS driver_pay,

    /* Derived metrics */
    DATEDIFF(
        'minute',
        TO_TIMESTAMP_NTZ("pickup_datetime" / 1000),
        TO_TIMESTAMP_NTZ("dropoff_datetime" / 1000)
    ) AS trip_duration_minutes,

    (
        COALESCE("base_passenger_fare", 0)
      + COALESCE("tips", 0)
      + COALESCE("tolls", 0)
      + COALESCE("sales_tax", 0)
      + COALESCE("bcf", 0)
      + COALESCE("congestion_surcharge", 0)
      + COALESCE("airport_fee", 0)
      + COALESCE("cbd_congestion_fee", 0)
    ) AS total_amount,

    /* Date attributes for analytics */
    DATE(TO_TIMESTAMP_NTZ("pickup_datetime" / 1000)) AS trip_date,
    EXTRACT(hour FROM TO_TIMESTAMP_NTZ("pickup_datetime" / 1000)) AS trip_hour

FROM RAW.HVFHV_TRIPS_RAW

/* Data quality filters */
WHERE
    "trip_miles" > 0
    AND TO_TIMESTAMP_NTZ("dropoff_datetime" / 1000)
        >= TO_TIMESTAMP_NTZ("pickup_datetime" / 1000);
