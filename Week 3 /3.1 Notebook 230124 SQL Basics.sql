USE bank;

SELECT * 
FROM card;   

SELECT loan_id, account_id
FROM loan; 

SELECT DISTINCT account_id 
FROM `order`;  --- Here we need a back tick as code confuses order with order by ---

SELECT AVG(amount) 
FROM `order`;

SELECT MAX(amount), MIN(amount) 
FROM loan;

SELECT account_id, amount, `status`
FROM loan
ORDER BY `status` DESC, amount DESC;

SELECT account_id, AVG(amount) AS average_amount
FROM loan
GROUP BY account_id 
ORDER BY average_amount DESC; 

SELECT account_id, amount 
FROM loan 
WHERE amount > 50000
ORDER BY amount ASC
LIMIT 5;

SELECT client_id, district_id 
FROM `client`
WHERE district_id = 1; 

# Retrieve the top 5 account_ids with the highest average amount ordered, but only including orders 
# with amounts bigger than 3k 

SELECT account_id, AVG(amount) AS average_amount 
FROM `order`
WHERE amount > 14800
GROUP BY account_id   
ORDER BY average_amount DESC
LIMIT 5;

# Retrieve the number of orders made by account 

USE bank; 

SELECT account_id, COUNT(order_id) AS count_of_orders
FROM `order`
GROUP BY account_id
HAVING COUNT(order_id) > 2;  

# # Retrieve accounts with more than 2 and fewer than 5 orders for orders with an amount under 5000

SELECT account_id, COUNT(order_id) AS count_of_orders
FROM `order`
WHERE amount < 5000
GROUP BY account_id
HAVING count_of_orders >2 AND count_of_orders <5;

# An alternative to the above is below 

SELECT account_id, COUNT(order_id) AS count_of_orders
FROM `order`
WHERE amount < 5000 
GROUP BY account_id
HAVING count_of_orders BETWEEN 3 AND 4; 

# We can create new labels in our table through the CASE formulation 

# Retrieve the account_id, loan_id and add a new column called "loan_size"  with values: 
# big_loan if amount greater than 50k
# medium_loan if amount between 25k and 50k 
# small_loan for all else 

SELECT account_id,loan_id,amount,
CASE 
	WHEN amount > 50000 THEN "big_loan"
    WHEN amount >= 25000 AND amount <= 50000 THEN "medium_loan"
    ELSE "small_loan"
    END AS loan_size
FROM loan; 

# Tip: 
# Round to 2 decimal places by ROUND(amount,2) 
# Round to nearest 10 by ROUND(amount, -1) 
# Round to nearest 100 by ROUND(amount, -10) 

