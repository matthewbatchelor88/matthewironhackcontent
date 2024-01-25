# Notebook on creating 'views' and 'temporary tables'

# VIEWS 

# Example in class - let's create a view of the top 5 most rented movies 

USE sakila; 

CREATE VIEW top5_movies AS 
SELECT title, COUNT(rental_id)  
FROM film 
INNER JOIN inventory 
USING(film_id)
INNER JOIN rental 
USING(inventory_id)
GROUP BY title
ORDER BY COUNT(rental_id) DESC
LIMIT 5; 

# Views can be recalled any time and will yield updated results

SELECT * 
FROM top5_movies; 

# You can alter views with command ALTER VIEW 

# Views can be exported as csv or other file type for data visualisation purposes 

# TEMPORARY TABLES 

CREATE TEMPORARY TABLE names AS 
SELECT first_name, last_name 
FROM actor;  

SELECT * FROM names; 

# CTE 

# CTE designed to improve readability of code 

# Example of a CTE as follows 

WITH average_spent AS (
    SELECT AVG(total_spent) AS avg_total_spent
    FROM (
        SELECT customer_id, SUM(amount) AS total_spent
        FROM payment 
        GROUP BY customer_id
    ) AS tspc
)
SELECT customer_id, SUM(amount) AS total_spent
FROM payment 
GROUP BY customer_id
HAVING total_spent > (SELECT avg_total_spent FROM average_spent);