--1. List all customers who live in Texas (use JOINs)

SELECT customer.customer_id, customer.first_name, customer.last_name
FROM customer
JOIN address ON customer.address_id = address.address_id
WHERE address.district = 'Texas';
--1. Get all payments above $6.99 with the Customer's FullName

SELECT c.first_name, c.last_name, p.amount
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN payment p ON r.rental_id = p.rental_id
WHERE p.amount > 6.99;
--3. Show all customers names who have made payments over $175(use subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
  SELECT customer_id
  FROM payment
  WHERE amount > 175
);
--4.List all customers that live in Nepal (use the city table)
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country = 'Nepal';

--5.Which staff member had the most transactions?

SELECT s.staff_id, COUNT(*) AS transaction_count
FROM staff s
JOIN sales sa ON s.staff_id = sa.staff_id
GROUP BY s.staff_id
ORDER BY transaction_count DESC
LIMIT 1;
--6. How many movies of each rating are there?
SELECT reviewes, COUNT(*) AS movie_count
FROM movies
GROUP BY reviewes ;
--7.Show all customers who have made a single payment
--above $6.99 (Use Subqueries)

SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING COUNT(*) = 1
);
--8. How many free rentals did our stores give away

SELECT COUNT(*) AS free_rentals_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN store s ON i.store_id = s.store_id
WHERE i.store_id  = 1;
 
