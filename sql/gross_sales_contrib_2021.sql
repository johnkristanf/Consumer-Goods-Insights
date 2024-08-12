
SET @total_sales = (
	SELECT 
		SUM(gp.gross_price * sm.sold_quantity)
	FROM 
		fact_sales_monthly as sm
	INNER JOIN 
		fact_gross_price as gp ON sm.product_code = gp.product_code
);

SELECT 
	dc.channel, 
    ROUND(SUM(gp.gross_price * sm.sold_quantity), 2) as gross_sales_mln,
    ROUND((SUM(gp.gross_price * sm.sold_quantity) / @total_sales) * 100, 2) as percentage
FROM 
	dim_customer as dc
INNER JOIN
	fact_sales_monthly as sm ON dc.customer_code = sm.customer_code
INNER JOIN 
	fact_gross_price as gp ON sm.product_code = gp.product_code
WHERE 
	sm.fiscal_year = 2021
GROUP BY
	dc.channel
	

