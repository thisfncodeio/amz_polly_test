SELECT  company_name, number_of_elevators
FROM dim_customers
WHERE number_of_elevators > 0
GROUP BY company_name,number_of_elevators 
order by number_of_elevators;