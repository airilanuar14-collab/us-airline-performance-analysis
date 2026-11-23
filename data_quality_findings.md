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

**Action Taken:**
- Verified the flight date range against the expected 2025 reporting period.
- Reviewed airline codes and identified 14 unique airlines.
- Confirmed that negative delay values represent early departures or arrivals and retained them.
- Checked cancellation and diversion flags for unexpected values.
- Identified and investigated records with departure or arrival delays exceeding 24 hours.
- Compared extreme delay records across airlines and examined their relationship with cancellation and diversion status.
- Flagged extreme delay records for further validation. No records were removed or modified at this stage.

**Status:** Pending Further Investigation

---

### 2.5 Data Consistency

**Objective:**  
Verify consistency between related columns, particularly flight status, cancellation codes and delay indicators.

**Findings:**
- Flights marked as both cancelled and diverted: To be updated
- Cancellation code distribution: To be updated
- Inconsistent arrival delay indicators: To be updated
- Inconsistent departure delay indicators: To be updated

**Action Taken:**
- Compared delay values against the 15-minute delay indicators.
- Investigated inconsistencies between related columns.
- Reviewed cancellation and diversion records.

**Status:** Pending

---

## 3. Summary of Key Findings

| Quality Check | Key Finding | Action Required |
|---|---|---|
| Dataset Structure | To be updated | To be updated |
| Missing Values | To be updated | To be updated |
| Duplicate Records | To be updated | To be updated |
| Data Validity | To be updated | To be updated |
| Data Consistency | To be updated | To be updated |

## 4. Data Cleaning Decisions

| Issue | Decision | Reason |
|---|---|---|
| Missing values | To be updated | Based on business context |
| Potential duplicates | To be updated | Investigate before removal |
| Negative delay values | Retain | Represents early departures or arrivals |
| Extreme delay values | To be updated | Investigate before treatment |
| Inconsistent records | To be updated | Validate against related columns |

## 5. Conclusion

The data quality assessment was conducted to evaluate the completeness, validity and consistency of the US Flight Delays 2025 dataset before proceeding with further analysis.

The findings from these checks will guide the data cleaning process and help ensure that subsequent SQL analysis and Power BI visualizations are based on reliable data.

**Project Status:** In Progress
