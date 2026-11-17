-- Phase: Data Quality Check 

-- Query 1 : Check total records
-- Purpose : To check total flight records in the dataset.
SELECT COUNT(*) AS total_records
FROM `projectmodule3-494603.airline_analysis.flights_raw`


-- Query 2: Preview data
-- Purpose : Identify column names, understand the data format, and ensure the import is successful.
SELECT *
FROM `projectmodule3-494603.airline_analysis.flights_raw`
LIMIT 10


-- Query 3: Check airline distribution
-- Purpose : Identify the airlines present in the dataset, check for NULL values ​​or unusual values, and understand the distribution of records by airline.
SELECT
    Reporting_Airline,
    COUNT(*) AS total_flights
FROM `projectmodule3-494603.airline_analysis.flights_raw`
GROUP BY Reporting_Airline
ORDER BY Reporting_Airline DESC;


-- Query 4: Check duplicate records
SELECT
    COUNT(*) AS total_records,
    (
        SELECT COUNT(*)
        FROM (
            SELECT DISTINCT
                flightDate,
                Reporting_Airline,
                Flight_Number_Reporting_Airline,
                OriginCityName,
                DestCityName
            FROM `projectmodule3-494603.airline_analysis.flights_raw`
        )
    ) AS unique_flight_combinations

FROM `projectmodule3-494603.airline_analysis.flights_raw`;


-- Query 5: Check inconsistent values in 'cancelled' column
SELECT
    cancelled,
    COUNT(*) AS total_records
FROM `projectmodule3-494603.airline_analysis.flights_raw`
GROUP BY cancelled
ORDER BY cancelled;


-- Query 6: Check inconsistent values in 'Diverted' column
SELECT
    Diverted,
    COUNT(*) AS total_records
FROM `projectmodule3-494603.airline_analysis.flights_raw`
GROUP BY Diverted
ORDER BY Diverted;


-- Query 7 : Check the outliers
SELECT
    MIN(DepDelay) AS min_DepDelay,
    MAX(DepDelay) AS max_DepDelay,
    MIN(ArrDelay) AS min_ArrDelay,
    MAX(ArrDelay) AS max_ArrDelay
FROM `projectmodule3-494603.airline_analysis.flights_raw`
