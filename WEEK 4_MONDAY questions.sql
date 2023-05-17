--1. How many actors are there with the last name ‘Wahlberg’?

SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

-> ANSWER: 2




--2. How many payments were made between $3.99 and $5.99?

SELECT COUNT(payment)
FROM payment
WHERE amount >= 3.99 AND amount <= 5.99

-> ANSWER: 0




--3. What film does the store have the most of? (search in inventory)

SELECT *
FROM inventory;

-> CURRENT ANSWER: ZORRO ARK 


--OTHER SOLUTION DRAFTS:

SELECT COUNT(film_name)
FROM inventory
GROUP BY film_name
ORDER BY COUNT(*) DESC

SELECT MAX(film_id) AS film_id
FROM title
ORDER BY COUNT(*) DESC


SELECT film_id, SUM()
FROM inventory
GROUP BY film_id
ORDER BY COUNT(*) DESC

------------------------------------------




--4. How many customers have the last name ‘William’?

SELECT last_name
FROM customer
WHERE last_name = 'William';

-> ANSWER: 0 




--5. What store employee (get the id) sold the most rentals?

SELECT staff_id
FROM rental
GROUP BY staff_id
ORDER BY COUNT(*) DESC

-> ANSWER: staff_id 1 = Mike Hillyer




--6. How many different district names are there?
 
SELECT COUNT(DISTINCT district) AS unique_district_count
FROM address;

-> ANSWER: 378




--7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(*) DESC

-> ANSWER: film_id 508




--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT COUNT(*) as customer_count
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';

-> ANSWER: 13




--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)


-- SELECT the payment amount + count the number of rentals
SELECT amount, COUNT(*) AS rental_count

-- SPECIFY the tables involved
FROM payment, rental, customers

-- CONNECT payments + rentals based on "rental_id"
WHERE payment.rental_id = rental.rental_id

-- CONNECT rentals + customers based on "customer_id"
AND rental.customer_id = customers.customer_id

-- FILTER customers with IDs between 380 and 430
AND customers.customer_id BETWEEN 380 AND 430

-- GROUP the results by payment amount
GROUP BY amount

-- FILTER groups where the count is greater than 250
HAVING COUNT(*) > 250;

-> ANSWER: 0




--10. Within the film table, how many rating categories are there? And what rating has the most
movies total?


--(10a) Within the film table, how many rating categories are there?

-- Count the distinct rating categories
SELECT COUNT(DISTINCT rating) AS category_count

-- Specify the film table
FROM film;

-> ANSWER: 5



--(10b) And what rating has the most movies total? 

-- SELECT the rating and count the number of movies
SELECT rating, COUNT(*) AS film_count

-- SPECIFY the film table
FROM film

-- GROUP the results by rating
GROUP BY rating

-- ORDER the groups in descending order based on "film_count"
ORDER BY COUNT(*) DESC

-> ANSWER: PG-13

