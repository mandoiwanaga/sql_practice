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


SELECT ArtistId, 
COUNT(Title) OVER(PARTITION BY ArtistId) 
FROM Album
LIMIT 10;