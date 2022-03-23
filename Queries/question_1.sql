SELECT extract(YEAR FROM creation_date) AS YEAR, extract(MONTH FROM creation_date) AS MONTH, COUNT(id) as "number of contact requests"
FROM      fact_contacts
GROUP BY  YEAR, MONTH
ORDER BY  YEAR, MONTH