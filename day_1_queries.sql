-- Select all columns from the actor table
SELECT * -- * means ALL COLUMNS
FROM actor;


-- Query for sepcific columns - SELECT column_name_1, col_name_2, etc. FROM table_name
SELECT first_name, last_name
FROM actor;


-- Filter Rows - use WHERE clause - always comes after the FROM 
SELECT *
FROM actor
WHERE first_name = 'Nick';

SELECT first_name, actor_id
FROM actor 
WHERE last_name = 'Davis';

-- use wildcards with LIKE - % acts as a multi-character wildcars
-- can be any number of characters (0-infinity) - zero or many [\w\s]*
SELECT *
FROM actor
WHERE first_name LIKE 'M%';

SELECT *
FROM actor 
WHERE last_name LIKE '%r%';

-- Underscore (_) represents 1 and only 1 character
SELECT *
FROM actor
WHERE first_name LIKE '_i_';

SELECT *
FROM actor 
WHERE first_name LIKE '_i%';


-- Using AND and OR in the WHERE clause
-- OR - only one needs to be TRUE 
SELECT *
FROM actor
WHERE first_name LIKE 'N%' OR last_name LIKE 'W%';

-- AND - all conditions need to be TRUE
SELECT *
FROM actor
WHERE first_name LIKE 'N%' AND last_name LIKE 'W%';

SELECT *
FROM film;


-- Comparing Operators in SQL:
-- Greater Than >   -- Less Than <
-- Greater Than or Equal >=  -- Less Than or Equal <=
-- Equal =   -- Not Equal <>

SELECT *
FROM payment;


-- Query all of the payments of more than $7.00
SELECT customer_id, amount
FROM payment 
WHERE amount > 7.00;


SELECT customer_id, amount
FROM payment 
WHERE amount >= '7';


SELECT *
FROM customer
WHERE store_id <> 2; -- NOT EQUAL


SELECT *
FROM actor
WHERE first_name NOT LIKE 'P%';

SELECT *
FROM actor 
WHERE first_name != 'Nick';


-- Get all of the payments between $3 and $8 (inclusive)
SELECT *
FROM payment
WHERE amount >= 6 AND amount <= 8;

-- BETWEEN/AND
SELECT *
FROM payment 
WHERE amount BETWEEN 6 AND 8;

SELECT *
FROM country;


-- Query the countries that have 'i' as the second to last letter
SELECT *
FROM country
WHERE country LIKE '%i_';


-- ORDERING the rows of data - Order By
-- ORDER BY col_name (Deafult ASC, add DESC for descending)

SELECT *
FROM actor
ORDER BY last_name;

SELECT *
FROM actor 
ORDER BY first_name DESC;


-- Can also order by with numbers
SELECT *
FROM payment 
WHERE customer_id = 594
ORDER BY amount DESC;


-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()
-- take in a column_name as an argument and returns a single value

SELECT SUM(amount)
FROM payment;


SELECT SUM(amount)
FROM payment 
WHERE amount > 5;


SELECT SUM(amount)
FROM payment
WHERE customer_id = 594;

-- Get the average payment
SELECT AVG(amount)
FROM payment;


-- Get the min and max of payments -- also alias the column name - col_name AS alias_name
SELECT MIN(amount) AS lowest_amount_paid, MAX(amount) AS greatest_amount_paid
FROM payment;


-- Get the total number of payments in the payment table
SELECT COUNT(*)
FROM payment;

SELECT *
FROM staff;

-- Get the total number of Staff
SELECT COUNT(*)
FROM staff; -- RETURNS 2 because there ARE 2 rows

-- Get the total number of staff where picture column is not NULL
SELECT COUNT(picture)
FROM staff; -- RETURNS 1 because ONLY one ROW has a picture, the other IS NULL

-- How many payments did customer 594 make?
SELECT COUNT(*)
FROM payment
WHERE customer_id = 594;

-- Calculate a column based on two other columns
SELECT payment_id, rental_id, payment_id - rental_id AS difference
FROM payment;

SELECT payment_id - rental_id AS difference
FROM payment;

-- CONCAT - will concatenate two strings together

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM customer;



