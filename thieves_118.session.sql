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

-- Select the customer's first name, last name, and city name
SELECT customer.first_name, customers.last_name, city.city_name
FROM customer
-- Join the City table to retrieve city information
JOIN city ON customer.city_id = city.city_id
-- Filter the results to only include customers from Nepal
WHERE city.country = 'Nepal';


--5. Which staff member had the most transactions?  




--6. How many movies of each rating are there?




--7.Show all customers who have made a single payment above $6.99 (Use Subqueries) 




--8. How many free rentals did our stores give away?