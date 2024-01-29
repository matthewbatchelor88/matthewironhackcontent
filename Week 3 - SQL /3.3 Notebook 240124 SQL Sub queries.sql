USE SAKILA;

# Retrieve name of actor where actor_id is 4

SELECT first_name, last_name, actor_id 
FROM actor 
WHERE actor_id = 4; 

# Retrieve actors who appeared in film where film_id is 4

SELECT first_name, last_name
FROM actor 
INNER JOIN film_actor 
USING(actor_id) 
WHERE film_id = 4;

# Now let's try this with a sub-query 

SELECT actor_id 
FROM film_actor 
WHERE film_id = 4; 

SELECT first_name, last_name 
FROM actor
WHERE actor_id IN (SELECT actor_id 
					FROM film_actor 
					WHERE film_id = 4);
                    
SELECT first_name, last_name
FROM actor 
WHERE actor_id IN (SELECT actor_id
					FROM film_actor
                    WHERE film_id = (SELECT film_id
										FROM film
                                        WHERE title="Adaptation Holes")); 