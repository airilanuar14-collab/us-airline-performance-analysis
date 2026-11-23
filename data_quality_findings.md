# Data Quality Assessment – US Flight Delays 2025

## 1. Dataset Overview

| Metric | Result |
|---|---|
| Dataset Name | US Flight Delays 2025 |
| Source | Kaggle – US Flight Delays 2025 (BTS On-Time Performance) |
| Database | Google BigQuery |
| Table Name | `flights` |
| Total Records | 7,001,619 |
| Total Columns | 40 |
| Date Range | 1st January 2025 - 31st December 2025 |
| Total Airlines | 14 |

## 2. Data Quality Checks

### 2.1 Dataset Structure and Completeness

**Objective:**  
Understand the dataset structure, number of records, available columns and date coverage.

**Findings:**
- Total records: 7,001,619
- Total columns: 40
- Date range: 1st January 2025 - 31st December 2025
- Number of airlines: 14
- Monthly record counts account for the full dataset of 7,001,619 flights.
- Verified that all 12 months contain flight records.
- Monthly flight volumes range from 504,884 to 631,428 records.
- July recorded the highest flight volume, while February recorded the lowest.
- Monthly record distribution:
  
| Month | Total flights |
|---|---|
| 1 | 539,747 |
| 2 | 504,884 |
| 3 | 600,872 |
| 4 | 583,950 |
| 5 | 605,648 |
| 6 | 611,575 |
| 7 | 631,428 |
| 8 | 602,378 |
| 9 | 562,439 |
| 10 | 605,844 |
| 11 | 570,550 |
| 12 | 582,304 |

**Action Taken:**
- Reviewed the dataset schema and verified the data types of all 40 columns.
- Confirmed that the dataset covers the full 2025 calendar year (January–December).
- Verified that all 12 months contain flight records.
- Identified monthly variations in flight record volumes for further analysis.

---

### 2.2 Missing Values

**Objective:**  
Identify missing values in important columns that may affect the analysis.

**Findings:**

| Column | Missing Records | Observation |
|---|---:|---|
| FlightDate | 0 | No missing values. Flight date information is complete. |
| Reporting_Airline | 0 | No missing values. Airline identification is complete.|
| DepDelay | 98,591 | Missing values occur exclusively in cancelled flights. These values are likely related to flights that did not operate. |
| ArrDelay | 122,135 | 	Missing values are associated with cancelled and diverted flights. One additional normal flight record was identified with missing actual arrival information, requiring further investigation. |
| Cancelled | 0 | No missing values. Flight cancellation status is available for all records. |
| Diverted | 0 | No missing values. Flight diversion status is available for all records. |
| CancellationCode | 6,898,743 | All missing values correspond to flights that were not cancelled. These NULL values are expected and do not indicate a data quality issue. |

**Action Taken:**
- Identified missing departure and arrival delay values by flight status.
- Confirmed that all missing `ArrDelay` values among cancelled and diverted flights are associated with their operational status.
- Investigated one normal flight record with missing arrival information:
  - Identified that actual arrival time, arrival delay and related flight duration fields were unavailable.
  - Retained the original record and excluded missing arrival delay values from calculations requiring valid arrival outcomes.
- Confirmed that missing `CancellationCode` values correspond to non-cancelled flights.
- Retained expected NULL values without replacing them with zero.

**Status:** Pending

---

### 2.3 Duplicate Records

**Objective:**  
Identify potential duplicate flight records using a combination of flight date, airline, flight number, origin, destination and scheduled departure time.

**Findings:**
- No duplicate records were detected based on the selected combination of six columns.
- The query returned no results, indicating that no repeated combinations were found.

**Action Taken:**
- Performed duplicate checks using a composite key consisting of flight date, airline, flight number, origin, destination and scheduled departure time.
- Confirmed that no duplicate groups were identified.
- No duplicate removal was required based on this check.

---

### 2.4 Data Validity

**Objective:**  
Check whether important values fall within expected ranges and follow the dataset's business rules.

**Findings:**

**1. Flight Date Validation**
  - Earliest flight date: 1 January 2025.
  - Latest flight date: 31 December 2025.
  - No records were found outside the expected reporting period.
  - Total invalid dates: 0.

**2. Airline Code Validity**
  - Identified 14 unique airline codes.
  - All displayed airline codes follow a consistent two-character format.
  - No NULL or empty airline code groups were displayed in the grouped results.

**3. Delay Values**
  - Minimum departure delay: -115 minutes.
  - Maximum departure delay: 4,352 minutes.
  - Minimum arrival delay: -128 minutes.
  - Maximum arrival delay: 4,336 minutes.
  - Negative departure delays: 4,017,675 records.
  - Negative arrival delays: 4,176,073 records.
  - Negative delay values represent flights departing or arriving earlier than scheduled and are considered valid operational values.

**4. Cancellation and Diversion Flags**
  - Cancellation flags contain only two values: 0 and 1.
  - 0: 6,898,743 records (not cancelled).
  - 1: 102,876 records (cancelled).
  - Diversion flags contain only two values: 0 and 1.
  - 0: 6,982,361 records (not diverted).
  - 1: 19,258 records (diverted).
  - No unexpected flag values or NULL groups were displayed.

**5. Extreme Delay Values**
  - 637 records had departure delays exceeding 24 hours (1,440 minutes).
  - 643 records had arrival delays exceeding 24 hours.
  - Extreme delays were concentrated among a small number of airlines, particularly AA, OH and OO.
  - A total of 665 records had at least one departure or arrival delay exceeding 24 hours.
  - Of these, 655 records involved flights that were neither cancelled nor diverted, 2 involved diverted flights, and 8 involved cancelled flights.
  - Among the 655 non-cancelled and non-diverted flights:
    - 615 records (93.9%) had both departure and arrival delays exceeding 24 hours.
    - 12 records (1.8%) had only departure delays exceeding 24 hours.
    - 28 records (4.3%) had only arrival delays exceeding 24 hours.
  - All 10 cancelled or diverted records had missing actual arrival times.
  - The extreme delay values require further investigation to determine whether they represent genuine operational disruptions or potential timestamp inconsistencies.

**6. Delay Cause Validation**
  - No negative values were identified in the five delay cause columns.
  - All non-NULL delay cause values were zero or positive.
  - No data modification was required based on this check.

**Action Taken:**
- Verified the flight date range against the expected 2025 reporting period.
- Reviewed airline codes and identified 14 unique airlines.
- Confirmed that negative delay values represent early departures or arrivals and retained them.
- Checked cancellation and diversion flags for unexpected values.
- Identified and investigated records with departure or arrival delays exceeding 24 hours.
- Compared extreme delay records across airlines and examined their relationship with cancellation and diversion status.
- Flagged extreme delay records for further validation. No records were removed or modified at this stage.
- Checked all five delay cause columns for negative values.
- Confirmed that no negative values were detected in the available delay cause data.
- Retained the original values without modification, as no data validity issues were identified through this check.

**Status:** Pending Further Investigation

---

### 2.5 Data Consistency

**Objective:**  
To identify discrepancies between related columns and verify whether records follow the expected business rules.

**Findings:**

**1. Cancellation vs Diversion Status**
  - Total records checked: 7,001,619.
  - No records were found with both Cancelled = 1 and Diverted = 1.
  - Cancellation and diversion statuses showed no overlapping records.

**2. Cancelled Flights with Arrival Delay**
  - No cancelled flights were found with non-NULL arrival delay values.
  - All cancelled flight records had NULL values in ArrDelay.
  - This is consistent with the expected business rule.

**3. Delay Cause Consistency**
  - Records with at least one positive delay cause value: 1,534,624.
  - Flights with arrival delays of 15 minutes or more: 1,534,638.
  - A difference of 14 records was identified.
  - Further investigation found that all 14 records were delayed flights without any positive values in the five delay cause columns.
  - No records were found with positive delay cause values but without an arrival delay of at least 15 minutes.

**4. Flight Status Validation**
  - Flight status classification identified 5 categories: On Time, Delayed, Cancelled, Diverted and Unknown.
  - One record was classified as Unknown due to missing arrival delay information.
  - The record was previously identified as a non-cancelled, non-diverted flight with incomplete arrival information.
  - No changes were made to the original record.

**Action Taken:**
- Compared cancellation and diversion statuses to identify overlapping records.
- Verified that cancelled flights did not have recorded arrival delays.
- Compared recorded delay causes against flights classified as delayed based on arrival delay.
- Identified 14 delayed flights without recorded positive delay cause values.
- Flagged these 14 records for further investigation. No records were removed or modified.
- Classified flight records into five categories: On Time, Delayed, Cancelled, Diverted and Unknown.
- Investigated the single record classified as Unknown and identified missing arrival information.
- Retained the original record without assigning an estimated flight status or modifying its values.

**Status:** Pending Further Investigation

---

## 3. Summary of Key Findings

| Quality Check | Key Finding | Action Required |
|---|---|---|
| Dataset Structure | The dataset contains 7,001,619 flight records across 40 columns, covering all 12 months of 2025 and 14 airlines. | No structural issues identified. Dataset structure and monthly coverage are considered adequate for further analysis. |
| Missing Values | Missing values were mainly found in DepDelay, ArrDelay and CancellationCode. Most missing delay values were associated with cancelled or diverted flights. One additional non-cancelled, non-diverted flight was found with incomplete arrival information. | Retain expected NULL values for cancelled and diverted flights. Exclude records without valid arrival outcomes from relevant delay and on-time performance calculations. Investigate the single incomplete arrival record further. |
| Duplicate Records | No duplicate groups were detected based on the selected combination of flight date, airline, flight number, origin, destination and scheduled departure time. | No duplicate removal required based on the composite-key check performed. |
| Data Validity | Flight dates fall within the 2025 reporting period. Negative departure and arrival delays are valid early operations. No negative values were found in the five delay cause columns. However, 665 records contain departure or arrival delays exceeding 24 hours and require further verification. | Retain valid negative delay values. Flag extreme delays for further investigation and avoid removing or modifying them without additional evidence. |
| Data Consistency | No flights were simultaneously marked as cancelled and diverted. No cancelled flights had an arrival delay recorded. Flight status classification identified one Unknown record due to missing arrival information. Additionally, 14 delayed flights had no positive value recorded across the five delay cause columns. | Retain the original records. Investigate the one Unknown record and the 14 delayed flights without positive recorded delay causes. |

---

## 4. Data Cleaning Decisions

The following decisions were established based on the data quality assessment findings.

| **Issue** | **Decision** | **Reason** |
| --------------------- | ------------- | --------------------------------------- |
| Missing values | Retain expected NULL values; exclude records without valid arrival outcomes from relevant calculations. | Missing delay values are mainly associated with cancelled and diverted flights. One additional record has incomplete arrival information. |
| Potential duplicates | No removal required based on the composite-key check. | No duplicate groups were detected using the selected combination of flight date, airline, flight number, origin, destination and scheduled departure time. |
| Negative delay values | Retain | Negative values represent early departures or arrivals and are valid operational records. |
| Extreme delay values | Retain and flag for further investigation. | Records with delays exceeding 24 hours may represent genuine operational disruptions or potential timestamp issues. Further validation is required before treatment. |
| Inconsistent records | Retain and flag records requiring further investigation. | One Unknown flight status record and 14 delayed flights without positive recorded delay causes were identified. These records should not be modified without further evidence. |
| Delay cause values | Retain | No negative values were detected in the five delay cause columns. NULL values require separate consideration based on business context. |

---

## 5. Conclusion

The data quality assessment was conducted to evaluate the completeness, validity and consistency of the US Flight Delays 2025 dataset before proceeding with further analysis.

The findings from these checks will guide the data cleaning process and help ensure that subsequent SQL analysis and Power BI visualizations are based on reliable data.
