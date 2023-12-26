/* Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? */

SELECT 
	price_year AS Year,
	food_category,	
	concat(price_value, " ", price_unit) AS amount,
	concat(price, " Czk") AS price,
    LAG(price) OVER (PARTITION  BY food_category ORDER BY price_year) AS previous_price,
    round(
    ((price - LAG(price) OVER (PARTITION  BY food_category
    							ORDER BY price_year)) / LAG(price) OVER (PARTITION  BY food_category
    																	ORDER BY price_year)) * 100,2) AS annual_percentage_increase							
FROM t_nikola_pincova_project_sql_primary_final 
WHERE food_category IS NOT NULL AND food_category LIKE '%banán%'
GROUP BY food_category,payroll_year
ORDER BY food_category,payroll_year
