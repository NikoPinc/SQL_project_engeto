-- Discord Nikola P. / Nico#0240
SELECT
	payroll_year,
	ROUND(pay) AS pay,
	branch_name,
    ROUND(((pay - LAG(pay) OVER (PARTITION  BY branch_name ORDER BY payroll_year)) / LAG(pay) OVER (PARTITION  BY branch_name ORDER BY payroll_year)) * 100,2) AS increase							
FROM
	t_nikola_pincova_project_sql_primary_final
GROUP BY 
	branch_name, payroll_year 