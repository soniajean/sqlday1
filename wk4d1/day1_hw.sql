1.How many actors are there with the last name ‘ Wahlberg ’ ? 2
SELECT first_name,
	last_name
FROM actor
WHERE last_name = 'Wahlberg';
2.How many payments were made between $3.99 and $5.99 ? 5
SELECT customer_id,
	amount
from payment
WHERE amount BETWEEN 3.99 AND 7.99;
3.What film does the store have the most of ? (search in inventory)
SELECT film_id,
	COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;
4.How many customers have the last name ‘ William ’ ?
SELECT first_name,
	last_name
FROM customer
WHERE last_name = 'William';
5.What store employee (get the id) sold the most rentals ?
SELECT customer_id,
	count(*) as Total_Rentals
FROM rental
GROUP BY customer_id
ORDER BY Total_Rentals DESC
LIMIT 1 6.How many different district names are there ? 378
SELECT district
FROM address
GROUP BY district 7.What film has the most actors in it ? (
		use film_actor table
		and get film_id
	) Zorro Ark
select film_id
FROM film_actor
GROUP BY film_actor.film_id
ORDER BY film_id DESC
LIMIT 1
select title,
	film_id
FROM film
where film_id = 1000;
8.
From store_id 1,
	how many customers have a last name ending with ‘ es ’ ? (use customer table) 21
select *
from customer
where last_name like '%es' 9.How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430 ? (
		use
		group by
			and
		having > 250
	)
SELECT count(*)
FROM (
		SELECT amount
		FROM payment
		WHERE CUSTOMER_ID BETWEEN 380 AND 430
		GROUP BY amount
		HAVING count(amount) > 250
	) AS sub 10.Within the film table,
	how many rating categories are there ?
	And what rating has the most - movies total ?
SELECT rating,
	count(rating) AS ratings
FROM film
GROUP BY rating
ORDER BY ratings DESC