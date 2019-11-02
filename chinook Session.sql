SELECT *,
SUM(Quantity) AS total_quantity
FROM InvoiceLine;


SELECT *,
SUM(Quantity) OVER() AS total_quantity
FROM InvoiceLine
LIMIT 10;