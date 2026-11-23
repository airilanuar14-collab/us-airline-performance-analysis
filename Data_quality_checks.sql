--Check 1 – Dataset Structure
--Objective: To understand the structure of the dataset before conducting analysis.
SELECT
    column_name,
    data_type,
    is_nullable
FROM
    `projectmodule3-494603.airline_analysis.INFORMATION_SCHEMA.COLUMNS`
WHERE
    table_name = 'flights_raw'
ORDER BY
    ordinal_position;


    
-- Check 2 : Total records
-- Objective: To determine the total number of flights in the dataset.    
    SELECT
    COUNT(*) AS total_records
FROM
    `projectmodule3-494603.airline_analysis.flights_raw`;


-- check the number of records by month:
SELECT
    Month AS flight_month,
    COUNT(*) AS total_records
FROM
    `projectmodule3-494603.airline_analysis.flights_raw`
GROUP BY
    flight_month
ORDER BY
    flight_month;


-- Check 3 – Missing Values (NULL)
-- Objective: Identify columns with missing values ​​and measure the extent of data loss.
SELECT
    COUNT(*) AS total_records,

    COUNTIF(flightDate IS NULL)
        AS missing_flight_date,

    COUNTIF(Reporting_Airline IS NULL)
        AS missing_airline,

    COUNTIF(Flight_Number_Reporting_Airline IS NULL)
        AS missing_flight_number,

    COUNTIF(OriginCityName IS NULL)
        AS missing_origin,

    COUNTIF(DestCityName IS NULL)
        AS missing_destination,

    COUNTIF(DepDelay IS NULL)
        AS missing_dep_delay,

    COUNTIF(ArrDelay IS NULL)
        AS missing_arr_delay,

    COUNTIF(Cancelled IS NULL)
        AS missing_cancelled,

    COUNTIF(Diverted IS NULL)
        AS missing_diverted

FROM
    `projectmodule3-494603.airline_analysis.flights_raw`;


-- Check 3 – Missing Values (NULL)
-- Objective: To identify flights that were neither cancelled nor diverted are no null values ​​in the DepDelay and ArrDelay column.
SELECT
    Cancelled,
    Diverted,
    COUNT(*) AS total_records,
    COUNTIF(DepDelay IS NULL) AS missing_dep_delay,
    COUNTIF(ArrDelay IS NULL) AS missing_arr_delay
FROM
    `projectmodule3-494603.airline_analysis.flights_raw`
GROUP BY
    Cancelled,
    Diverted
ORDER BY
    Cancelled,
    Diverted;


-- There is one flight record that was neither cancelled nor diverted, yet it has a missing entry for ArrDelay.
SELECT
    FlightDate,
    Reporting_Airline,
    Flight_Number_Reporting_Airline,
    Origin,
    Dest,
    Cancelled,
    Diverted,
    DepDelay,
    ArrDelay
FROM
    `projectmodule3-494603.airline_analysis.flights_raw`
WHERE
    ArrDelay IS NULL
    AND Cancelled = 0
    AND Diverted = 0;


-- Addtional query to investigate this record
SELECT
    FlightDate,
    Reporting_Airline,
    Flight_Number_Reporting_Airline,
    Origin,
    Dest,
    CRSArrTime,
    ArrTime,
    ArrDelay,
    ArrDelayMinutes,
    ArrDel15,
    ActualElapsedTime,
    AirTime,
    WheelsOn,
    TaxiIn
FROM
    `projectmodule3-494603.airline_analysis.flights_raw`
WHERE
    FlightDate = '2025-09-06'
    AND Reporting_Airline = 'YX'
    AND Flight_Number_Reporting_Airline = 5859
    AND Origin = 'JFK'
    AND Dest = 'MVY';


-- Check 3 : Missing values (NULL)
-- Objective : To check NULL DepDelay and ArrDelay for cancelled and diverted flight
SELECT
    CASE
        WHEN Cancelled = 1 THEN 'Cancelled'
        WHEN Diverted = 1 THEN 'Diverted'
    END AS flight_status,

    COUNT(*) AS total_records,

    COUNTIF(DepDelay IS NULL)
        AS missing_dep_delay,

    COUNTIF(ArrDelay IS NULL)
        AS missing_arr_delay

FROM `projectmodule3-494603.airline_analysis.flights_raw`

WHERE
    Cancelled = 1
    OR Diverted = 1

GROUP BY flight_status;


-- Check 4 : Duplicate records
-- Objective: To determine whether there are any duplicate flight records.
SELECT
    flightDate,
    Reporting_Airline,
    Flight_Number_Reporting_Airline,
    OriginCityName,
    DestCityName,
    CRSDepTime,

    COUNT(*) AS duplicate_count

FROM
    `projectmodule3-494603.airline_analysis.flights_raw`

GROUP BY
    flightDate,
    Reporting_Airline,
    Flight_Number_Reporting_Airline,
    OriginCityName,
    DestCityName,
    CRSDepTime

HAVING COUNT(*) > 1

ORDER BY duplicate_count DESC;


-- Check 5 – Data Validity
-- Objective: To ensure that the values ​​in the dataset fall within a reasonable range
-- A. Flight date validity - Anticipate that all records will fall within the 2025 period.
SELECT
    MIN(flightDate) AS earliest_date,
    MAX(flightDate) AS latest_date,

    COUNTIF(
        flightDate < '2025-01-01'
        OR flightDate > '2025-12-31'
    ) AS invalid_dates

FROM
    `projectmodule3-494603.airline_analysis.flights_raw`


-- B. Airline code validity
-- To check NULL airlines code, empty strings, unconsistent code, total airlines in the dataset
SELECT
    Reporting_Airline,
    COUNT(*) AS total_flights

FROM
    `projectmodule3-494603.airline_analysis.flights_raw`

GROUP BY Reporting_Airline

ORDER BY total_flights DESC;


-- C. Delay values validity
SELECT
    MIN(DepDelay) AS min_dep_delay,
    MAX(DepDelay) AS max_dep_delay,

    MIN(ArrDelay) AS min_arr_delay,
    MAX(ArrDelay) AS max_arr_delay,

    COUNTIF(DepDelay < 0) AS negative_dep_delay,
    COUNTIF(ArrDelay < 0) AS negative_arr_delay

FROM
    `projectmodule3-494603.airline_analysis.flights_raw`


-- D. Cancellation flags
SELECT
    Cancelled,
    COUNT(*) AS total_records

FROM
    `projectmodule3-494603.airline_analysis.flights_raw`

GROUP BY Cancelled

ORDER BY Cancelled;


-- E. Diversion flags
SELECT
    Diverted,
    COUNT(*) AS total_records

FROM
    `projectmodule3-494603.airline_analysis.flights_raw`

GROUP BY Diverted

ORDER BY Diverted;


-- Check 6 – Data Consistency
-- Objective: To detect discrepancies between several related columns.
-- A. Cancelled vs Diverted
SELECT
    COUNT(*) AS total_records,

    COUNTIF(
        Cancelled = 1 AND Diverted = 1
    ) AS both_cancelled_and_diverted

FROM
    `projectmodule3-494603.airline_analysis.flights_raw`;


-- B. Cancelled flights with arrival delay
SELECT
    COUNT(*) AS inconsistent_records

FROM
    `projectmodule3-494603.airline_analysis.flights_raw`

WHERE
    Cancelled = 1
    AND ArrDelay IS NOT NULL;


-- C. Delay cause consistency
SELECT
    COUNT(*) AS total_records,

    COUNTIF(
        COALESCE(CarrierDelay, 0) > 0
        OR COALESCE(WeatherDelay, 0) > 0
        OR COALESCE(NASDelay, 0) > 0
        OR COALESCE(SecurityDelay, 0) > 0
        OR COALESCE(LateAircraftDelay, 0) > 0
    ) AS records_with_delay_causes,

    COUNTIF(
        ArrDelay >= 15
    ) AS delayed_flights

FROM
    `projectmodule3-494603.airline_analysis.flights_raw`;


-- Check 7 – Flight Status Validation
-- Objective: Ensure consistent flight status classification.
SELECT
    CASE
        WHEN Cancelled = 1 THEN 'Cancelled'
        WHEN Diverted = 1 THEN 'Diverted'
        WHEN ArrDelay >= 15 THEN 'Delayed'
        WHEN ArrDelay < 15 THEN 'On Time'
        ELSE 'Unknown'
    END AS flight_status,

    COUNT(*) AS total_records

FROM
    `projectmodule3-494603.airline_analysis.flights_raw`

GROUP BY flight_status

ORDER BY total_records DESC;


SELECT
    FlightDate,
    Reporting_Airline,
    Flight_Number_Reporting_Airline,
    OriginCityName,
    DestCityName,

    Cancelled,
    Diverted,
    DepDelay,
    ArrDelay

FROM
    `projectmodule3-494603.airline_analysis.flights_raw`

WHERE
    Cancelled != 1
    AND Diverted != 1
    AND (ArrDelay IS NULL);


-- Check 8 – Delay Cause Validation
-- Objective: Examine the values ​​and distribution of delay causes.
SELECT
    COUNTIF(CarrierDelay < 0)
        AS negative_carrier_delay,

    COUNTIF(WeatherDelay < 0)
        AS negative_weather_delay,

    COUNTIF(NASDelay < 0)
        AS negative_nas_delay,

    COUNTIF(SecurityDelay < 0)
        AS negative_security_delay,

    COUNTIF(LateAircraftDelay < 0)
        AS negative_late_aircraft_delay

FROM
    `projectmodule3-494603.airline_analysis.flights_raw`


-- Total minutes of delay by cause:
    SELECT
    SUM(CarrierDelay) AS carrier_delay_minutes,
    SUM(WeatherDelay) AS weather_delay_minutes,
    SUM(NASDelay) AS nas_delay_minutes,
    SUM(SecurityDelay) AS security_delay_minutes,
    SUM(LateAircraftDelay) AS late_aircraft_delay_minutes

FROM
    `projectmodule3-494603.airline_analysis.flights_raw`


-- Check 9 – Monthly Data Completeness
SELECT
    Month AS flight_month,

    COUNT(*) AS total_flights,

    COUNTIF(Cancelled = 1) AS cancelled_flights,

    COUNTIF(Diverted = 1) AS diverted_flights,

    COUNTIF(
        Cancelled = 0
        AND Diverted = 0
        AND ArrDelay >= 15
    ) AS delayed_flights

FROM
    `projectmodule3-494603.airline_analysis.flights_raw`

GROUP BY flight_month

ORDER BY flight_month;
