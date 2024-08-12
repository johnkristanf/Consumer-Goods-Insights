
SELECT 
	dc.customer_code, 
    dc.customer,
    AVG(pi.pre_invoice_discount_pct) as average_discount_percentage
FROM 	
	dim_customer as dc
INNER JOIN
	fact_pre_invoice_deductions as pi ON dc.customer_code = pi.customer_code
WHERE
	pi.fiscal_year = 2021 AND dc.market = 'India'
GROUP BY 
	dc.customer_code, dc.customer
ORDER BY 
    average_discount_percentage DESC
LIMIT 5;
