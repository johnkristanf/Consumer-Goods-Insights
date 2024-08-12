SELECT 
	dc.market 
FROM 
	dim_customer as dc
WHERE 
	dc.customer = 'Atliq Exclusive' AND dc.region = 'APAC';