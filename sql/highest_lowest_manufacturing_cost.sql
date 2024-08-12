SET @max_cost = (SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost);

SET @min_cost = (SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost);

SELECT 
	dp.product_code,
    dp.product,
    mc.manufacturing_cost
FROM 
	dim_product as dp
INNER JOIN 
	fact_manufacturing_cost as mc ON dp.product_code = mc.product_code
WHERE 
	mc.manufacturing_cost IN (@max_cost, @min_cost)