-- MULTI JOIN
-- NOTE: Its good practice to do no more than 3 joins in a multijoin.
-- Start from the actor table, join to the film_actor table, join to the film table

SELECT actor.actor_id, first_name, last_name, title, inventory.last_update
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
INNER JOIN inventory
ON film.film_id = inventory.film_id;



-- Subqueries
-- You can use subqueries 3 different ways
-- SELECT, FROM, and WHERE clauses

-- WHERE is the most common
-- SELECT is the most uncommon

-- Query 1: Find all customer_ids that have spent more than $175

--V.1
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id;

--------------------
--V.2
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id;
HAVING SUM(amount) > 175;

--cant use WHERE with aggregators ---->> LOOK UP PER CA




-- Query 2: Get all customer info
SELECT *
FROM CUSTOMER;

-- NOW our subquery to combine them together using WHERE and IN

SELECT first_name, last_name, email, customer_id
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

-- Another Subquery Example (adding joins)
-- query first_name, last_name actors that worked on the movie "Mulan Moon"

SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
    SELECT actor.actor_id
    FROM actor
    INNER JOIN film_actor
    ON actor.actor_id = film_actor.actor_id
    INNER JOIN film
    ON film_actor.film_id = film.film_id
    WHERE title = 'Mulan Moon'
);

