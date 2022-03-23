SELECT extract(YEAR FROM creation_date) AS YEAR, extract(MONTH FROM creation_date) AS MONTH, COUNT(id) as "number of quotes"
FROM      fact_quotes
GROUP BY  YEAR, MONTH
ORDER BY  YEAR, MONTH