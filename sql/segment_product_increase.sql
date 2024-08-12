WITH product_counts AS (
	SELECT 
		dp.segment, 
		COUNT(DISTINCT CASE WHEN mc.cost_year = 2020 THEN dp.product END) as product_count_2020,
		COUNT(DISTINCT CASE WHEN mc.cost_year = 2021 THEN dp.product END) as product_count_2021
	FROM 
		dim_product as dp
	INNER JOIN 
		fact_manufacturing_cost as mc ON dp.product_code = mc.product_code
	GROUP BY 
		dp.segment
)

SELECT 
segment,
product_count_2020, 
product_count_2021, 
ROUND(((product_count_2021 - product_count_2020) / product_count_2020)  * 100, 2) as difference
FROM product_counts

