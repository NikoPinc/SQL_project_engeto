-- Discrord Nikola P. / Nico#0240
SELECT 
	payroll_year,
	food_category,
	concat(price_value, " ", price_unit) AS amount,
	concat(price, " Czk") AS price,
	concat(floor(avg(pay)), " Czk") AS average_pay,
	concat(floor(avg(pay) / price), " pcs") AS amount_for_pay
FROM 
	t_nikola_pincova_project_sql_primary_final 
WHERE
	(payroll_year NOT BETWEEN 2007 AND 2017 AND food_category LIKE '%Chléb%')
OR	
	(payroll_year NOT BETWEEN 2007 AND 2017 AND food_category LIKE '%mléko%')
GROUP BY 
	food_category,payroll_year
ORDER BY 
	food_category,payroll_year