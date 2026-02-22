-- code to create the database 
create database ecommerce;

-- import the cleaned table into the database 

-- SALES PERFORMANCE ANALYSIS
-- 1. Total Revenue Generated
SELECT 
    ROUND(SUM(totalsale), 2) AS total_revenue
FROM cleaned_retail_dataset
WHERE price_satus = 'Normal Transaction';

-- 2. Monthly Sales Trend
SELECT 
    DATE_FORMAT(invoicedate, '%Y-%m') AS sales_month,
    ROUND(SUM(totalsale), 2) AS monthly_revenue
FROM cleaned_retail_dataset
WHERE price_satus = 'Normal Transaction'
GROUP BY sales_month
ORDER BY sales_month;

-- 3. Top 10 Best-Selling Products (By Revenue)
SELECT 
    description,
    ROUND(SUM(totalsale), 2) AS revenue
FROM cleaned_retail_dataset
WHERE price_satus = 'Normal Transaction'
GROUP BY description
ORDER BY revenue DESC
LIMIT 10;

-- 4. Revenue by Country
SELECT 
    country,
    ROUND(SUM(totalsale), 2) AS revenue
FROM cleaned_retail_dataset
WHERE price_satus = 'Normal Transaction'
GROUP BY country
ORDER BY revenue DESC;

-- 5. Top 10 Customers by Revenue
SELECT 
    customerid,
    ROUND(SUM(totalsale), 2) AS customer_revenue
FROM cleaned_retail_dataset
WHERE customerid IS NOT NULL
AND price_satus = 'Normal Transaction'
GROUP BY customerid
ORDER BY customer_revenue DESC
LIMIT 10;
