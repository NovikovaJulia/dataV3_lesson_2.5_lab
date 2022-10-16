-- dataV3_lesson_2.5_lab

-- Select all the actors with the first name ‘Scarlett’.
USE sakila;
SELECT first_name, last_name FROM actor
WHERE first_name = 'SCARLETT';

-- How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(film_id) AS films_available FROM film;
SELECT COUNT(DISTINCT inventory_id) AS rented_films FROM rental;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) AS max_duration, MIN(length) as min_duration FROM film;

-- What's the average movie duration expressed in format (hours, minutes)?
SELECT ROUND((AVG(length)/60),2) AS duration_in_hours,
		ROUND(AVG(length),2) AS duration_in_minutes
        FROM film;

-- How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM actor;

-- Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) FROM rental;

-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, MONTH(rental_date), WEEKDAY(rental_date) FROM rental
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' 
-- depending on the rental day of the week.
SELECT *,
	CASE
		WHEN WEEKDAY(rental_date) < 6 then 'workday'
		ELSE 'weekend'
		END AS 'day_type'
    FROM rental;

-- Get release years.
SELECT DISTINCT(release_year) FROM film;

-- Get all films with ARMAGEDDON in the title.
SELECT * FROM film
WHERE title LIKE '%ARMAGEDDON%';

-- Get all films which title ends with APOLLO.
SELECT * FROM film
WHERE title LIKE '%APOLLO';

-- Get 10 the longest films.
SELECT * FROM film
ORDER BY length DESC;

-- How many films include Behind the Scenes content?
SELECT COUNT(film_id) FROM film
WHERE special_features LIKE '%Behind the Scenes%';
