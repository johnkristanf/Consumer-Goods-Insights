
SELECT 
	MONTHNAME(sm.date) as Month,
    YEAR(sm.date) as Year,
    ROUND(SUM(gp.gross_price * sm.sold_quantity), 2) as Gross_sales_Amount
FROM 
	dim_customer as dm
INNER JOIN 
	fact_sales_monthly as sm ON dm.customer_code = sm.customer_code
INNER JOIN 
	fact_gross_price as gp ON sm.product_code = gp.product_code
WHERE 
	dm.customer = 'Atliq Exclusive'
GROUP BY 
	Month, Year
	
