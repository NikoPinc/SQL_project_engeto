/* Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli,
 *  pokud HDP vzroste výrazněji v jednom roce,
projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem? */
CREATE TABLE t_nikola_pincova_project_SQL_secondary_final AS
(
SELECT 
	e.country,
	e.YEAR,
	e.GDP
FROM economies e
LEFT JOIN countries c ON c.country = e.country 
WHERE c.continent = 'Europe' AND YEAR BETWEEN 2006 AND 2018
)