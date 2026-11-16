# US Airline Performance Analysis – 2025
### Evaluating Airline Punctuality, Flight Delays & Operational Efficiency

## 1. Project Overview

This project analyzes the operational performance of airlines in the United States throughout 2025 using flight on-time performance data.

The analysis focuses on evaluating airline punctuality, identifying flight delay patterns, investigating the main causes of delays, and comparing operational performance across different airlines.

Using SQL and Power BI, this project aims to transform raw flight data into meaningful insights that can help identify operational inefficiencies and support data-driven decision-making.

## 2. Business Problem

Flight delays can affect airline operational efficiency, passenger satisfaction, and overall service reliability.

Airline management needs to understand how well airlines perform in terms of punctuality, which airlines experience the most delays, and what factors contribute to these delays.

This project addresses these challenges by analyzing flight performance data and identifying opportunities for operational improvement.

## 3. Project Objectives

- Evaluate Airline Punctuality: Measure and compare on-time performance across airlines to identify which carriers maintain the best punctuality.

- Assess Operational Reliability: Compare flight delay, cancellation, and diversion rates to evaluate airline operational performance.

- Analyze Delay Performance: Compare average departure and arrival delays across airlines to understand differences in delay duration.

- Identify Operational Disruptions: Investigate the main causes of flight delays and cancellations to identify key factors affecting airline operations.

- Examine Monthly Trends: Analyze monthly variations in flight delay, cancellation, and diversion rates to identify seasonal patterns and periods of higher operational disruption.

- Understand Delay Propagation: Examine how departure delays affect arrival performance and whether airlines can recover lost time during flight operations.

- Develop Data-Driven Insights: Translate analytical findings into meaningful insights and recommendations to support better airline operational decision-making.

## 4. Business Questions

This project aims to answer the following questions:

1. Which airlines have the highest on-time performance?
2. Which airlines have the highest rates of flight delays, cancellations, and diversions?
3. How do average departure and arrival delays compare across different airlines?
4. What are the main causes of flight delays and cancellations?
5. How do flight delay, cancellation, and diversion rates vary across different months?
6. How do departure delays affect arrival performance?

## 5. Dataset

**Dataset Name:** US Flight Delays 2025 – BTS On-Time Performance

**Source:** [Kaggle – US Flight Delays 2025](https://www.kaggle.com/datasets/a7madmostafa/us-flight-delays-2025-bts-on-time-performance)

**Data Period:** January – December 2025

The dataset contains flight-level information, including:

| Data Category | Key Information |
|---|---|
| Flight Information | Flight date, flight number |
| Airline Information | Operating carrier |
| Airport Information | Origin and destination airports |
| Schedule Information | Scheduled departure and arrival times |
| Actual Flight Information | Actual departure and arrival times |
| Delay Information | Departure and arrival delay minutes |
| Cancellation | Flight cancellation status |
| Diversion | Flight diversion status |
| Delay Causes | Carrier, weather, NAS, security, late aircraft |

*Note: Actual dataset structure and column availability will be verified during data inspection.*

## 6. Tools & Technologies

| Tool | Purpose |
|---|---|
| PostgreSQL | Data storage, cleaning and SQL analysis |
| pgAdmin | Database management and query execution |
| Power BI | Data visualization and interactive dashboard |
| GitHub | Project documentation and version control |

## 7. Data Cleaning & Preparation

The raw dataset will undergo data quality checks and preparation before analysis.

Key activities include:

- Inspecting dataset structure and data types.
- Combining monthly CSV files into a consolidated dataset.
- Identifying and investigating duplicate records.
- Checking missing values in important columns.
- Validating flight dates, delay values and flight statuses.
- Handling cancelled and diverted flights appropriately.
- Creating derived fields such as flight status, delay category, month and day of week.
- Preparing cleaned data for SQL analysis.

The original dataset will be preserved separately from the cleaned dataset.

## 8. SQL Analysis

SQL will be used to perform exploratory and business-focused analysis.

Key SQL techniques include:

- SELECT, WHERE and ORDER BY
- GROUP BY and aggregate functions
- CASE WHEN statements
- JOIN operations
- Common Table Expressions (CTEs)
- Window Functions
- Date and time functions

The analysis will focus on answering the six business questions defined in this project.

## 9. Key Performance Indicators (KPIs)

The following KPIs will be used to evaluate airline operational performance:

| KPI | Description |
|---|---|
| Total Flights | Total number of scheduled flight records |
| On-Time Performance (OTP) | Percentage of eligible flights arriving less than 15 minutes late |
| Delayed Flights | Number of flights arriving 15 minutes or more late |
| Delay Rate | Percentage of eligible flights experiencing delays |
| Average Arrival Delay | Average arrival delay in minutes |
| Total Delay Minutes | Total reported delay minutes |
| Cancellation Rate | Percentage of scheduled flights cancelled |

KPI denominators will be defined consistently, with cancelled and diverted flights excluded from arrival punctuality calculations.

## 10. Power BI Dashboard

An interactive Power BI dashboard will be developed to present the analysis findings.

The dashboard will consist of three main sections:

### Page 1 – Executive Overview
- Total flights
- On-time performance percentage
- Delayed flights percentage
- Average arrival delay
- Monthly OTP trends
- Flight status distribution

### Page 2 – Airline Performance
- OTP comparison by airline
- Delay percentage by airline
- Average arrival delay by airline
- Monthly airline performance comparison
- Airline performance ranking

### Page 3 – Delay Analysis
- Flight delay causes by airline
- Monthly delay trends
- Departure vs. arrival delay comparison
- Delay category distribution
- Airline delay performance comparison

Interactive filters will allow users to explore performance by airline and month.

## 11. Key Findings

*To be updated after completing the SQL analysis and Power BI dashboard.*

The findings will highlight:

- Best and worst performing airlines.
- Airlines with the highest delay rates.
- Main contributors to flight delays.
- Monthly flight delay patterns.
- The relationship between departure and arrival delays.

## 12. Business Recommendations

*To be updated based on actual analysis findings.*

Potential areas for improvement may include:

- Improving aircraft turnaround scheduling.
- Reviewing operational processes contributing to carrier-related delays.
- Improving flight scheduling and departure punctuality.
- Monitoring seasonal delay patterns.
- Developing targeted operational improvement strategies.

## 13. Project Structure

```text
US-Airline-Performance-Analysis/
│
├── README.md
│
├── SQL/
│   ├── 01_data_quality.sql
│   ├── 02_airline_performance.sql
│   ├── 03_delay_analysis.sql
│   ├── 04_monthly_trends.sql
│   └── 05_departure_arrival.sql
│
├── PowerBI/
│   └── Airline_Performance.pbix
│
├── Documentation/
│   └── Data_Cleaning_Notes.md
│
└── Dashboard_Screenshots/
    ├── executive_overview.png
    ├── airline_performance.png
    └── delay_analysis.png
```

## 14. Conclusion

This project demonstrates an end-to-end data analytics workflow, from raw data preparation and SQL analysis to interactive dashboard development and business recommendations.

By analyzing airline punctuality and flight delays, the project aims to demonstrate how data analytics can support operational performance evaluation and data-driven decision-making in the aviation industry.

---

**Project Status:** In Progress

**Author:** [Your Name]

**Role:** Aspiring Data Analyst
