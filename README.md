Task 6 – Sales Trend Analysis Using Aggregations
Objective
Analyze monthly revenue and order volume from the online_sales dataset to identify sales trends over time.

Dataset
Table: details.csv

Columns Used:

Order ID – Unique order identifier
Order Date – Original order date in text format (DD-MM-YYYY)
Amount – Order amount (numeric)
order_date – Converted DATE column created during preprocessing

Tools Used
MySQL (compatible with PostgreSQL / SQLite with syntax adjustments)

Process :

Database Selection:
  Use the target database (amitdb).

Date Conversion:
  Add a new order_date column of type DATE.

Convert Order Date text values to DATE format using STR_TO_DATE().

Query Steps

a. Extract month from order_date using EXTRACT(MONTH FROM order_date).
b. Group results by year and month
c. Calculate total monthly revenue using SUM(Amount).
d. Calculate total unique orders using COUNT(DISTINCT Order ID).
e. Sort results in chronological order with ORDER BY year, month.
f. Filter results for a specific time range using WHERE order_date BETWEEN ....

Key SQL Functions Used:

EXTRACT(YEAR/MONTH FROM date) – Extracts year/month from a date.
SUM() – Calculates total revenue.
COUNT(DISTINCT ...) – Counts unique orders.
GROUP BY – Groups data by year and month.
ORDER BY – Sorts results.
WHERE ... BETWEEN – Filters by date range.

Example Output

| year | month | total\_revenue | total\_orders |
| ---- | ----- | -------------: | ------------: |
| 2018 | 1     |          52171 |           150 |
| 2018 | 2     |          44244 |           132 |
| 2018 | 3     |          56880 |           147 |
| ...  | ...   |            ... |           ... |

Learning Outcome:

Converting and cleaning date fields for analysis.
Aggregating data to identify sales patterns over time.
Filtering and sorting data for specific analytical insights.
