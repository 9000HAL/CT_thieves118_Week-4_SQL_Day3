------------------------------------------------------------------------
--Week 5 - Wednesday Questions -----------------------------------------




--1. List all customers who live in Texas (use JOINs)  

SELECT *
FROM customer

-- JOIN the payment table to retrieve customer information
JOIN payment ON customer.customer_id = payment.customer_id

-- FILTER the results to only include customers from Texas
WHERE address_id = 'Texas';

-> Gabe CURRENT QUERY RESULT: invalid input syntax for type smallint: "Texas"




--2. Get all payments above $6.99 with the Customer's Full Name  

-- Select the customer's first name, last name, and payment amount
SELECT customer.first_name, customer.last_name, payment.amount
FROM customer

-- Join the Payments table to retrieve payment information
JOIN payment ON customer.customer_id = payment.customer_id

-- Filter the results to only include payments above $6.99
WHERE payment.amount > 6.99;

-> ANSWER:

"first_name","last_name","amount"
"Douglas","Graf","919.67"
"Mary","Smith","478.86"
"Alfredo","Mcadams","74.94"
"Mary","Smith","980.45"
"Peter","Menard","73.99"
"Peter","Menard","67.99"
"Peter","Menard","73.99"
"Peter","Menard","68.99"
"Peter","Menard","73.99"
"Peter","Menard","71.99"
"Peter","Menard","66.99"
"Peter","Menard","72.99"
"Alvin","Deloach","33.44"
"Peter","Menard","68.99"
"Peter","Menard","66.99"
"Peter","Menard","74.99"
"Peter","Menard","70.99"
"Peter","Menard","70.99"
"Peter","Menard","66.99"
"Peter","Menard","72.99"
"Peter","Menard","70.99"
"Peter","Menard","68.99"
"Peter","Menard","70.99"
"Peter","Menard","66.99"
"Peter","Menard","68.99"
"Peter","Menard","68.99"
"Peter","Menard","75.99"




--3. Show all customers names who have made payments over $175(use subqueries) 

-- Select the customer's first name and last name
SELECT customer.first_name, customer.last_name
FROM customer

-- Join the Payments table to retrieve payment information
JOIN payment ON customer.customer_id = payment.customer_id

-- Filter the results to only include payments over $175
WHERE payment.amount > 175;

-> ANSWER:

"first_name","last_name"
"Douglas","Graf"
"Mary","Smith"
"Mary","Smith"




--4. List all customers that live in Nepal (use the city table)

SELECT *
FROM country
-> Nepal country_id = '66'

-- Select the customer's first name, last name, and city name
SELECT customer.first_name, customer.last_name, city.country_id
FROM customer
-- Join the City table to retrieve city information
JOIN city ON customer.address_id = city.city_id
-- Filter the results to only include customers from Nepal
WHERE city.country_id = '66';

-> ANSWER:

"first_name","last_name","country_id"
"Jane","Bennett",66




--5. Which staff member had the most transactions?  

-- SELECT for the staff member with the highest number of transactions( = RENTAL not PAYMENT)
SELECT staff.staff_id, staff.first_name, staff.last_name
FROM staff
-- Join the Transactions table to retrieve transaction information
JOIN rental ON staff.staff_id = rental.staff_id
-- Group the results by staff member and count the number of transactions
GROUP BY staff.staff_id, staff.first_name, staff.last_name
-- Order the results in descending order based on the number of transactions
ORDER BY COUNT(*) DESC

-> ANSWER:

"staff_id","first_name","last_name"
1,"Mike","Hillyer"




--6. How many movies of each rating are there?

-- COUNT the number of movies for each rating
SELECT film.rating, COUNT(*) AS film_count
FROM film
-- GROUP the results by rating
GROUP BY film.rating;

-> ANSWER:

"rating","film_count"
"NC-17","209"
"G","178"
"PG-13","223"
"PG","194"
"R","196"




-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries) 
***** NOTE: (2)ANSWERS HERE DEPENDING UPON INTERPRETATION OF QUESTION:

-- 7.(a) Show all customers who have made a single payment(AS IN AT LEAST ONE AND ONLY ONE) above $6.99 (Use Subqueries) 

-- SELECT the customer's first name and last name
SELECT customer.first_name, customer.last_name
FROM customer
-- JOIN the payment table to retrieve payment info
JOIN payment ON customer.customer_id = payment.customer_id
-- FILTER the results to include customers with only one payment above $6.99
WHERE payment.amount > 6.99
GROUP BY customer.customer_id, customer.first_name, customer.last_name
HAVING COUNT(*) = 1;

-> 7.(a) ANSWER:

"first_name","last_name"
"Douglas","Graf"
"Alvin","Deloach"
"Alfredo","Mcadams"


***** CONSIDERING ANOTHER INTERPRETATION:
-- 7.(b) Show all customers who have made a single payment(AS IN AT LEAST ONE SINGLE PAYMENT AND INCLUDING ALSO MORE THAN ONE PAYMENT) above $6.99 (Use Subqueries) 

-- SELECT the customer's first name and last name
SELECT customer.first_name, customer.last_name
FROM customer
-- JOIN the payment table to retrieve payment info
JOIN payment ON customer.customer_id = payment.customer_id
-- FILTER the results to include customers with only one payment above $6.99
WHERE payment.amount > 6.99
GROUP BY customer.customer_id, customer.first_name, customer.last_name
HAVING COUNT(*) >= 1;

-> 7.(b) ANSWER:

"first_name","last_name"
"Mary","Smith"
"Peter","Menard"
"Douglas","Graf"
"Alvin","Deloach"
"Alfredo","Mcadams"




--8. How many free rentals did our stores give away?

-- COUNT the number of free rentals given away
SELECT COUNT(*) AS free_rental_count
FROM rental
-- JOIN the payment table to retrieve payment information
JOIN payment ON rental.rental_id = payment.rental_id
-- FILTER the results to include payments where the amount is $0.00
WHERE payment.amount = 0.00;

-> ANSWER:

"free_rental_count"
"0"
