WITH table_a
AS (
SELECT 
	price_year,
	food_category,
	price,
    LAG(price) OVER (PARTITION  BY food_category ORDER BY price_year) AS previous_price,
    round(
    ((price - LAG(price) OVER (PARTITION  BY food_category
    							ORDER BY price_year)) / LAG(price) OVER (PARTITION  BY food_category
    																	ORDER BY price_year)) * 100,2) AS annual_percentage_increase							
FROM t_nikola_pincova_project_sql_primary_final 
WHERE food_category IS NOT NULL
GROUP BY food_category,payroll_year
ORDER BY food_category,payroll_year
)
SELECT 
	price_year,
	food_category,
	price,
	previous_price,
	annual_percentage_increase
FROM table_a
GROUP BY price_year,food_category
HAVING ROUND(AVG(annual_percentage_increase),2) > 0.01
ORDER BY annual_percentage_increase asc
