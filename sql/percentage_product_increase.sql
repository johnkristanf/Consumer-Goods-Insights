
SET @prod_2020 = (
    SELECT 
		COUNT(DISTINCT dp.product) 
    FROM 
		dim_product as dp
    INNER JOIN 
		fact_manufacturing_cost as mc ON dp.product_code = mc.product_code
    WHERE 
		mc.cost_year = 2020
);

SET @prod_2021 = (
    SELECT 
		COUNT(DISTINCT dp.product) 
    FROM 
		dim_product as dp
    INNER JOIN 
		fact_manufacturing_cost as mc ON dp.product_code = mc.product_code
    WHERE 
		mc.cost_year = 2021
);

SET @increase_percentage = (
    ((@prod_2021 - @prod_2020) / @prod_2020) * 100
);

SELECT 
    @prod_2020 as unique_products_2020,  
    @prod_2021 as unique_products_2021,
    ROUND(@increase_percentage, 2) as percentage_chg;


-- SELECT 
-- 	mc.cost_year, 
-- 	COUNT(mc.cost_year) as products_count
-- FROM 
-- 	dim_product as dp
-- INNER JOIN 
-- 	fact_manufacturing_cost as mc ON dp.product_code = mc.product_code
-- GROUP BY 
-- 	mc.cost_year
    
