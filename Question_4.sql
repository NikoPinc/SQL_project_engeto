With table_a AS(
SELECT 
	price_year AS Year,	
	SUM(price) AS price,
    LAG(SUM(price)) OVER (ORDER BY price_year) AS previous_price,
    ROUND(
    ((SUM(price) - LAG(SUM(price)) OVER (ORDER BY price_year)) / LAG(SUM(price)) OVER (ORDER BY price_year)) * 100,2) AS annual_percentage_increase							
FROM t_nikola_pincova_project_sql_primary_final 
WHERE food_category IS NOT NULL
GROUP BY payroll_year
ORDER BY payroll_year
)
SELECT
 YEAR,
 ROUND(price) AS price,
 ROUND(previous_price) AS previous_price,
 annual_percentage_increase
FROM table_a
GROUP BY year
ORDER BY annual_percentage_increase desc;