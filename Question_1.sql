-- Discrord Nikola P. / Nico#0240
SELECT ROUND(AVG(pay)) AS average_pay, branch_name, payroll_year 
FROM t_nikola_pincova_project_sql_primary_final
WHERE branch_name IS NOT NULL AND payroll_year NOT BETWEEN 2007 AND 2017
GROUP BY branch_name, payroll_year
ORDER BY branch_name, payroll_year 