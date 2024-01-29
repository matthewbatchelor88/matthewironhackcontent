USE BANK;

# Inner Join Account and Loan, show columns account_id, district_id, loan amount 

SELECT a.account_id, a.district_id, l.amount 
FROM account AS a
INNER JOIN loan AS l 
ON a.account_id = l.account_id;

# Alternatively where 2 columns across tables have same name, we could deploy USING()command 

SELECT a.account_id, a.district_id, l.amount 
FROM account AS a
INNER JOIN loan AS l 
USING(account_id); 

# Retrieve the number of loans per district; order by loan count and show top 5 results 
# Hint use account and loan tables 

SELECT a.district_id, COUNT(l.loan_id) AS loan_count 
FROM account AS a
INNER JOIN loan as l
ON a.account_id = l.account_id # In this case, one could also use HAVING account_id 
GROUP BY a.district_id 
ORDER BY loan_count DESC
LIMIT 5; 

# How many cities in Canada, using Sakila? 

USE Sakila; 

SELECT COUNT(DISTINCT city) AS number_of_cities
FROM city 
INNER JOIN country 
USING(country_id)
WHERE country = "Canada"; 

# Retrieve the number of addresses per country. This requires a double inner-join, as shown below.  

SELECT country, COUNT(DISTINCT address_id) 
FROM address 
INNER JOIN city 
USING(city_id)  
INNER JOIN country 
USING(country_id)
GROUP BY country; 
