# Data Quality Assessment – US Flight Delays 2025

## 1. Dataset Overview

| Metric | Result |
|---|---|
| Dataset Name | US Flight Delays 2025 |
| Source | Kaggle – US Flight Delays 2025 (BTS On-Time Performance) |
| Database | Google BigQuery |
| Table Name | `flights` |
| Total Records | To be updated |
| Total Columns | 40 |
| Date Range | To be updated |
| Total Airlines | To be updated |

## 2. Data Quality Checks

### 2.1 Dataset Structure and Completeness

**Objective:**  
Understand the dataset structure, number of records, available columns and date coverage.

**Findings:**
- Total records: To be updated
- Total columns: 39
- Date range: To be updated
- Number of airlines: To be updated
- Monthly record distribution: To be updated

**Action Taken:**
- Reviewed the dataset schema and data types.
- Verified the date range and monthly data coverage.

**Status:** Pending

---

### 2.2 Missing Values

**Objective:**  
Identify missing values in important columns that may affect the analysis.

**Findings:**

| Column | Missing Records | Observation |
|---|---:|---|
| FlightDate | To be updated | To be updated |
| Reporting_Airline | To be updated | To be updated |
| DepDelay | To be updated | To be updated |
| ArrDelay | To be updated | To be updated |
| Cancelled | To be updated | To be updated |
| Diverted | To be updated | To be updated |
| CancellationCode | To be updated | To be updated |

**Action Taken:**
- Investigated missing values based on their business context.
- Distinguished expected NULL values from potential data quality issues.
- Avoided removing records without sufficient justification.

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
