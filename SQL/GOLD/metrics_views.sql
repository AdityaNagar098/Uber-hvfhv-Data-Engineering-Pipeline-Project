-- =========================================================
-- GOLD LAYER: BUSINESS METRICS VIEWS
-- =========================================================

USE DATABASE UBER_ANALYTICS;
USE SCHEMA GOLD;

-- ---------------------------------------------------------
-- Trips & Revenue by Hour
-- ---------------------------------------------------------
CREATE OR REPLACE VIEW V_TRIPS_REVENUE_BY_HOUR AS
SELECT
    d.date,
    d.hour,
    c.company_name,
    COUNT(*)                    AS trips,
    SUM(f.total_amount)         AS total_revenue,
    AVG(f.trip_miles)           AS avg_trip_miles,
    AVG(f.trip_duration_minutes) AS avg_trip_duration_min
FROM FACT_TRIPS f
JOIN DIM_DATETIME d
  ON f.datetime_id = d.datetime_id
JOIN DIM_COMPANY c
  ON f.company_id = c.company_id
GROUP BY d.date, d.hour, c.company_name;

-- ---------------------------------------------------------
-- Daily Revenue Trend
-- ---------------------------------------------------------
CREATE OR REPLACE VIEW V_DAILY_REVENUE AS
SELECT
    d.date,
    c.company_name,
    COUNT(*)            AS trips,
    SUM(f.total_amount) AS total_revenue,
    SUM(f.driver_pay)   AS total_driver_pay
FROM FACT_TRIPS f
JOIN DIM_DATETIME d
  ON f.datetime_id = d.datetime_id
JOIN DIM_COMPANY c
  ON f.company_id = c.company_id
GROUP BY d.date, c.company_name;

-- ---------------------------------------------------------
-- Top Pickup Locations
-- ---------------------------------------------------------
CREATE OR REPLACE VIEW V_TOP_PICKUP_LOCATIONS AS
SELECT
    pickup_location_id,
    COUNT(*) AS trips
FROM FACT_TRIPS
GROUP BY pickup_location_id
ORDER BY trips DESC;

-- ---------------------------------------------------------
-- Weekday vs Weekend Analysis
-- ---------------------------------------------------------
CREATE OR REPLACE VIEW V_WEEKDAY_WEEKEND AS
SELECT
    d.day_type,
    COUNT(*)            AS trips,
    SUM(f.total_amount) AS total_revenue,
    AVG(f.trip_miles)   AS avg_trip_miles
FROM FACT_TRIPS f
JOIN DIM_DATETIME d
  ON f.datetime_id = d.datetime_id
GROUP BY d.day_type;

-- ---------------------------------------------------------
-- Company Market Share
-- ---------------------------------------------------------
CREATE OR REPLACE VIEW V_COMPANY_MARKET_SHARE AS
SELECT
    c.company_name,
    COUNT(*)            AS trips,
    SUM(f.total_amount) AS total_revenue,
    ROUND(
        100.0 * COUNT(*) / SUM(COUNT(*)) OVER (),
        2
    ) AS trip_share_pct
FROM FACT_TRIPS f
JOIN DIM_COMPANY c
  ON f.company_id = c.company_id
GROUP BY c.company_name;

-- ---------------------------------------------------------
-- Driver Pay Efficiency
-- ---------------------------------------------------------
CREATE OR REPLACE VIEW V_DRIVER_PAY_RATIO AS
SELECT
    c.company_name,
    SUM(f.driver_pay)   AS total_driver_pay,
    SUM(f.total_amount) AS total_revenue,
    ROUND(
        SUM(f.driver_pay) / NULLIF(SUM(f.total_amount), 0),
        3
    ) AS driver_pay_ratio
FROM FACT_TRIPS f
JOIN DIM_COMPANY c
  ON f.company_id = c.company_id
GROUP BY c.company_name;
