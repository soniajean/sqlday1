-- Hello World!
-- This is a comment!
-- sql version of Hello World
SELECT * -- what?
FROM actor;
-- from where?
SELECT *
FROM address;
-- let's grab the first and last name
SELECT first_name,
    last_name
FROM actor;
--Where clause
-- this is how we filter out the results of our conditionals
SELECT first_name,
    last_name
FROM actor
WHERE first_name = 'Nick';
--single quotes for Stringm literals verses Double quotes for database identifiers
--wew can use LIKE instead of just  = for strings
SELECT first_name,
    last_name
FROM actor
WHERE first_name LIKE 'Nick';
-- wildcards for use with like: _ and %
--% is a true wildcard -any character AND number of characters
-- _ is one character wildcard
-- 3 underscores means starts with J and 3 letters
SELECT first_name,
    last_name
FROM actor
WHERE first_name LIKE 'J____';
--comparison operators:
-- = and like examples above
-- Greater /less  than > < <= >= all valid as usuak
-- NOT equal <>
SELECT *
FROM address
WHERE district like 'Texas'
SELECt *
FROM payment;
--lets find customers who paid more than $2
SELECT customer_id,
    amount
from payment
WHERE amount > 2;
--query customers who paid less than 7.99
SELECT customer_id,
    amount
from payment
WHERE amount <= 7.99;
-- we can use OR AND with the where clause
SELECT customer_id,
    amount
from payment
WHERE amount <= 7.99
    AND amount > 0;
SELECT customer_id,
    amount
FROM payment
WHERE amount > 2
    OR amount > 7.99;
--we can also use BETWEEN, works the same as <= >=
SELECT customer_id,
    amount
from payment
WHERE amount BETWEEN 0 AND 7.99;
-- ORDER BY
SELECT customer_id,
    amount
from payment
WHERE amount BETWEEN 0 AND 7.99
ORDER BY amount ASC;
-- switch back and forth with ascending and descending, descending is the default
--not equal
SELECT customer_id,
    amount
from payment
WHERE amount <> 0.00
ORDER BY amount ASC;
SELECT customer_id,
    amount
from payment
WHERE amount > 10
SELECT *
from customer;
--checking out the customer table
SELECT first_name,
    last_name
from customer
where customer_id = 341;
-- Peter Menard is our big baller
-- SQL aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()
-- query to show the sumpf amounts greater than 5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;
SELECT *
from payment;
--what about individual amounts? Unique.. DISTINCT
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;
--query to display min amount greater than 6.99
SELECT MIN(amount)
FROM payment
WHERE amount > 6.99;
--query to display MAX amount greater than 6.99
SELECT MAX(amount) AS biggest_over_7
FROM payment
WHERE amount > 6.99;
--GROUP BY
--any column that is not selected in aggregate must be included in a group by used in conjuction
-- with the aggregates to modify behavior or aggregate groups rows
SELECT amount,
    count(amount),
    sum(amount)
FROM payment
GROUP BY amount
ORDER BY sum(amount) DESC;
-- bring it back to straight-forward examples
SELECT amount
FROM payment
WHERE amount = 6.99
SELECT amount,
    count(amount)
FROM payment
GROUP BY amount
ORDER By amount;
--lets look at customer ids with summed amounts for those ids
SELECT customer_id,
    SUM(amount)
From payment
Group By customer_id
ORder by customer_id ASC
SELECT customer_id,
    SUM(amount)
From payment
Group By customer_id
ORder by customer_id DESC
SELECT customer_id,
    amount
from payment
group by amount,
    customer_id
order by customer_id DESC
SELECT customer_id,
    sum(amount)
from payment
group by customer_id
order by customer_id --  query to look at customer_ids that show up more than 5 times
SELECT count(customer_id),
    email
from customer
where email like 'j__.w%'
group by email
having count(customer_id) > 0;
-- general rules ....
SELECT customer_id,
    sum(amount) --what you want to see
from payment -- from what table


    -- these are our basic building blocks
WHERE customer_id BETWEEN 70 and 80 -- how what defines the filter
GROUP BY customer_id -- using aggregates
HAVING sum(amount) > 150 --this is the how for aggregates or filter
order by customer_id --
LIMIT 2 -- limit responses, always at / towards end
OFFSET 1;
-- take the number we put in for the offset and start there 
SELECT *
FROM payment
where amount < -427.01
LIMIT 25 OFFSET 5 -- clauses we have talked about so far:
    --select <columns> <aggregates>
    -- from <table> 
    --where <conditional>
    --group by <columns>
    --having <conditional>
    -- order by <column>