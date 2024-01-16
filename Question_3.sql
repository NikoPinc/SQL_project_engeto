-- Discord Nikola P. / Nico#0240
WITH table_a 
AS (
	SELECT 
		price_year,
		food_category,
		price,
    	LAG(price) OVER (PARTITION  BY food_category ORDER BY price_year) AS first_price,
    	((price - LAG(price) OVER (PARTITION  BY food_category ORDER BY price_year)) / LAG(price) OVER (PARTITION  BY food_category ORDER BY price_year)) * 100 AS increase							
	FROM 
		t_nikola_pincova_project_sql_primary_final 
	WHERE 
		price_year NOT BETWEEN 2007 AND 2017
	GROUP BY 
		price_year, food_category
	ORDER BY 
		food_category, price_year
	)
SELECT 
	food_category,
	ROUND(first_price) AS first_price,
	ROUND(price) AS current_price,
	ROUND(AVG(increase),2) AS percentage_increase
FROM 
	table_a
WHERE 
	price_year = 2018
GROUP BY 
	food_category
ORDER BY
	increase ASC
	
