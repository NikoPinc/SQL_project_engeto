-- Discord Nikola P. / Nico#0240
WITH table_a AS(
SELECT 
	price_year AS year,	
	AVG(price) AS price,
    ROUND(((AVG(price) - LAG(AVG(price)) OVER (ORDER BY price_year)) / LAG(AVG(price)) OVER (ORDER BY price_year)) * 100,2) AS price_increase,
    ROUND(((AVG(pay) - LAG(AVG(pay)) OVER (ORDER BY price_year)) / LAG(AVG(pay)) OVER (ORDER BY price_year)) * 100,2) AS pay_increase,
    AVG(pay) AS pay
FROM 
	t_nikola_pincova_project_sql_primary_final 
GROUP BY 
	price_year
ORDER BY 
	price_year
)
SELECT
	year,
 	ROUND(price) AS "average price",
 	price_increase AS "annual price increase",
 	ROUND(pay) AS "average pay",
 	pay_increase AS "annual pay increase",
 	price_increase - pay_increase AS "difference in price/pay"
FROM 
	table_a
GROUP BY 
	year
ORDER BY 
	price_increase - pay_increase DESC
	