SELECT ROUND(AVG(pay)) AS average_pay, branch_name, payroll_year 
FROM t_nikola_pincova_project_sql_primary_final
WHERE branch_name IS NOT NULL
GROUP BY branch_name, payroll_year
ORDER BY branch_name, payroll_year 