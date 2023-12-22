/* Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)? */
With table_a AS(
SELECT 
	price_year AS Year,	
	concat(avg(price), " Czk") AS price,
    LAG(avg(price)) OVER (ORDER BY price_year) AS previous_price,
    round(
    ((avg(price) - LAG(avg(price)) OVER (ORDER BY price_year)) / LAG(avg(price)) OVER (ORDER BY price_year)) * 100,2) AS annual_percentage_increase							
FROM t_nikola_pincova_project_sql_primary_final 
WHERE food_category IS NOT NULL
GROUP BY payroll_year
ORDER BY payroll_year
)
SELECT
 YEAR,
 round(price,2) AS average_price,
 annual_percentage_increase
FROM table_a
GROUP BY year
ORDER BY annual_percentage_increase desc;