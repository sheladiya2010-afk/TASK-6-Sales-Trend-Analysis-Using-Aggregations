use amitdb;

ALTER TABLE details 
ADD COLUMN order_date DATE;

UPDATE details
SET order_date = STR_TO_DATE(`Order Date`, '%d-%m-%Y');

-- Disable safe updates for this session
SET SQL_SAFE_UPDATES = 0;

-- Convert your text date column to DATE format
UPDATE details
SET order_date = STR_TO_DATE(`Order Date`, '%d-%m-%Y');

-- (Optional) Turn safe updates back on
SET SQL_SAFE_UPDATES = 1;

#a. Use EXTRACT(MONTH FROM order_date) for month

SELECT 
    EXTRACT(MONTH FROM order_date) AS month
FROM details;

# b. GROUP BY year/month

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month
FROM details
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);
    
# c. Use SUM() for revenue

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(Amount) AS total_revenue
FROM details
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);

# d. COUNT(DISTINCT order_id) for volume

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT `Order ID`) AS total_orders
FROM details
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);

# e. Use ORDER BY for sorting

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(Amount) AS total_revenue,
    COUNT(DISTINCT `Order ID`) AS total_orders
FROM details
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY year, month;

# f. Limit results for specific time periods

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(Amount) AS total_revenue,
    COUNT(DISTINCT `Order ID`) AS total_orders
FROM details
WHERE order_date BETWEEN '2018-01-01' AND '2018-06-30'
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY year, month;
