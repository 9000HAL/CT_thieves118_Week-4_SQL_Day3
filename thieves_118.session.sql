--Week 5 - Wednesday Questions  




--1. List all customers who live in Texas (use JOINs)  

SELECT *
FROM customer
-- Join the Orders table to retrieve customer information
JOIN payment ON customer.customer_id = payment.customer_id
-- Filter the results to only include customers from Texas
WHERE address_id = 'Texas';

--> CURRENT QUERY RESULT: invalid input syntax for type smallint: "Texas"



SELECT *
FROM district



--2. Get all payments above $6.99 with the Customer's Full Name  


--3. Show all customers names who have made payments over $175(use subqueries) 




--4. List all customers that live in Nepal (use the city table)




--5. Which staff member had the most transactions?  




--6. How many movies of each rating are there?




--7.Show all customers who have made a single payment above $6.99 (Use Subqueries) 




--8. How many free rentals did our stores give away?