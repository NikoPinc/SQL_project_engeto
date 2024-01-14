-- Discrord Nikola P. / Nico#0240
SELECT 
	t1.payroll_year,
	t2.country, 
	t2.GDP,
	ROUND(((AVG(t2.GDP) - LAG(AVG(t2.GDP)) OVER (ORDER BY payroll_year)) / LAG(AVG(t2.GDP)) OVER (ORDER BY payroll_year)) *100,2) AS yearly_GDP_increase,
	ROUND(((AVG(t1.pay) - LAG(AVG(t1.pay)) OVER (ORDER BY payroll_year)) / LAG(AVG(t1.pay)) OVER (ORDER BY payroll_year)) *100,2) AS yearly_pay_increase,
	ROUND(((AVG(t1.price) - LAG(AVG(t1.price)) OVER (ORDER BY payroll_year)) / LAG(AVG(t1.price)) OVER (ORDER BY payroll_year)) *100,2) AS yearly_price_increase
FROM 
	t_nikola_pincova_project_sql_primary_final t1
JOIN 
	t_nikola_pincova_project_sql_secondary_final t2 ON t2.YEAR = t1.payroll_year 
WHERE 
	t2.country LIKE '%Czech%'
GROUP BY 
	t1.payroll_year