-- Define the Common Table Expressions (CTEs)
CREATE TABLE t_nikola_pincova_project_SQL_primary_final AS
WITH table_a AS(
SELECT
	AVG(cp.value) AS pay,
	cp.payroll_year AS payroll_year,
	cpib.name AS branch_name
FROM
	czechia_payroll cp
JOIN
	czechia_payroll_industry_branch cpib ON cpib.code = cp.industry_branch_code
WHERE
	value_type_code = 5958 AND payroll_year BETWEEN 2006 AND 2018 AND calculation_code = 200
GROUP BY
   cp.payroll_year, cpib.name
),
table_b AS(
SELECT
	AVG(cp.value) AS price,
	cpc.name AS food_category,
	cpc.price_value AS price_value,
	cpc.price_unit AS price_unit,
	YEAR(date_from) AS price_year
FROM
	czechia_price cp
JOIN
	czechia_price_category cpc ON cpc.code = cp.category_code
GROUP BY
	YEAR(date_from), cpc.name
)
SELECT *
FROM table_a ta
JOIN table_b tb ON tb.price_year = ta.payroll_year

