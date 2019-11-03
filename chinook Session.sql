-- Example query for aggregate function
SELECT *,
SUM(Quantity) AS total_quantity
FROM InvoiceLine;

-- Example query with window function
SELECT *,
SUM(Quantity) OVER() AS total_quantity
FROM InvoiceLine
LIMIT 10;

-- Example query with aggregate function using GROUP BY clause
SELECT InvoiceId,
ROUND(SUM(UnitPrice), 2) AS total_price
FROM InvoiceLine
GROUP BY InvoiceId
LIMIT 10;

-- Example query using window function and PARTITION BY clause
SELECT InvoiceId,
SUM(UnitPrice) OVER(PARTITION BY InvoiceId) AS total_price
FROM InvoiceLine
LIMIT 10;


-- Example query using NTILE window function
SELECT Name,
Milliseconds,
NTILE(4) OVER(ORDER BY Milliseconds) AS percentile
FROM Track
WHERE AlbumId = 5;


--- Example query using LAG window function
--- monthly change
WITH monthly_sales AS (
    SELECT strftime('%m', InvoiceDate) AS month,
    ROUND(SUM(Total)) AS total_sales
    FROM Invoice
    GROUP BY month
    ORDER BY month
)

SELECT month, 
total_sales,
total_sales - LAG(total_sales, 1) OVER(ORDER BY month) AS monthly_change 
FROM monthly_sales;


--- Example query using LAG window function to find monthly percent change
--- ((x/y)-1)*100 
WITH monthly_sales AS (
    SELECT strftime('%m', InvoiceDate) AS month,
    ROUND(SUM(Total)) AS total_sales
    FROM Invoice
    GROUP BY month
    ORDER BY month
)

SELECT month, 
total_sales,
ROUND(((total_sales/LAG(total_sales, 1) OVER (ORDER BY month)) - 1) * 100, 2) AS percent_change 
FROM monthly_sales;