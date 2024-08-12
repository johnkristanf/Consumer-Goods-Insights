
SELECT
	QUARTER(date) as Quarter,
    MAX(sold_quantity) as total_sold_quantity
FROM 
	fact_sales_monthly
WHERE
	YEAR(date) = 2020
GROUP BY Quarter
	