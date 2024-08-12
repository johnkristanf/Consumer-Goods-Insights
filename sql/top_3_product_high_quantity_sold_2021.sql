
SELECT 
	dp.division, 
    dp.product_code, 
    dp.product,
    SUM(sm.sold_quantity) as total_sold_quantity,
    RANK() OVER (ORDER BY SUM(sm.sold_quantity) DESC) as rank_order
FROM
	dim_product as dp
INNER JOIN
	fact_sales_monthly as sm ON dp.product_code = sm.product_code
WHERE 
	sm.fiscal_year = 2021
GROUP BY
	dp.division, 
    dp.product_code, 
    dp.product
ORDER BY 
	total_sold_quantity DESC
LIMIT 3;