-- Discrord Nikola P. / Nico#0240
CREATE TABLE t_nikola_pincova_project_SQL_secondary_final AS
(
SELECT 
	e.country,
	e.YEAR,
	e.GDP,
	e.gini,
	e.population
FROM economies e
JOIN countries c ON c.country = e.country 
WHERE c.continent = 'Europe' AND YEAR BETWEEN 2006 AND 2018
)