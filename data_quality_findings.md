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
- Potential duplicate groups: To be updated
- Records involved: To be updated

**Action Taken:**
- Investigated potential duplicates before deciding whether any records required removal.
- Retained records unless confirmed to be duplicate entries.

**Status:** Pending

---

### 2.4 Data Validity

**Objective:**  
Check whether important values fall within expected ranges and follow the dataset's business rules.

**Findings:**
- Invalid year or month values: To be updated
- Unexpected cancellation/diversion flag values: To be updated
- Negative departure delays: To be updated
- Negative arrival delays: To be updated
- Departure delays exceeding 24 hours: To be updated
- Arrival delays exceeding 24 hours: To be updated

**Action Taken:**
- Reviewed unusual values to determine whether they were valid operational scenarios or potential data errors.
- Retained negative delay values because they represent early departures or arrivals.

**Status:** Pending

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
