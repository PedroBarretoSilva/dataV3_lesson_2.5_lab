USE sakila;

-- 1)  Select all the actors with the first name ‘Scarlett’

SELECT * FROM sakila.actor
WHERE first_name = 'Scarlett';



-- 2)  How many films (movies) are available for rent and how many films have been rented?

SELECT count(DISTINCT title) FROM sakila.film;
-- 1000 films available

SELECT count(rental_id) FROM sakila.rental;
-- 16044 films rented, assuming that "films rented" means "sum of nr of times each film has been rented"




-- 3) What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT MAX(length) 
AS "max_durantion" 
FROM sakila.film;

-- the longest movie has a duration of 185


SELECT MIN(length) 
AS "min_durantion" 
FROM sakila.film;

-- the shortest movie has a duration of 46


-- 4) What's the average movie duration expressed in format (hours, minutes)?

SELECT round(AVG(length)/60,0) as 'Hours' , (round(AVG(length)/60,0)-AVG(length)/60)*60  as 'Minutes' 
FROM sakila.film;
-- SELECT "Minutes=" round((AVG(length)/60-round(AVG(length)/60,0))*60) FROM sakila.film;



-- 5) How many distinct (different) actors' last names are there?

SELECT count(DISTINCT last_name) FROM sakila.actor;
-- 121 different last names




-- 6) Since how many days has the company been operating (check DATEDIFF() function)?

SELECT date_format(min(rental_date), '%d-%m-%y') as "Operating since :" FROM sakila.rental;

-- 7) Show rental info with additional columns month and weekday. Get 20 results.

SELECT *, date_format(rental_date, '%M') AS "Month of Rental",
date_format(rental_date, '%W') AS "Weekday of Rental" ,
date_format(return_date, '%M') AS "Month of Return",
date_format(rental_date, '%W') AS "Weekday of Return"   
FROM sakila.rental
LIMIT 20;




-- 8) Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *, date_format(rental_date, '%M') AS 'Month of Rental',
	date_format(rental_date, '%W') AS 'Weekday of Rental' ,
	date_format(return_date, '%M') AS 'Month of Return',
	date_format(rental_date, '%W') AS 'Weekday of Return',   
	CASE
	WHEN (date_format(rental_date, '%W')='Saturday' OR date_format(rental_date, '%W')='Sunday')
	THEN 'weekend'
	ELSE 'workday'
	END AS 'day_type'
	FROM sakila.rental
    LIMIT 20;
    
    
    -- 9) Get release years.
    
SELECT DISTINCT(release_year) FROM sakila.film;
-- All films have been released in 2006



 -- 10) Get all films with ARMAGEDDON in the title
 SELECT title FROM sakila.film
 WHERE title LIKE ('%ARMAGEDDON%');
 
 
 
  -- 11) Get all films which title ends with APOLLO.
SELECT title FROM sakila.film
WHERE RIGHT(title,6)='APOLLO';




-- 12) Get 10 the longest films.
SELECT title FROM sakila.film
ORDER BY length DESC
LIMIT 10;



-- 13) How many films include Behind the Scenes content?
SELECT count(title) FROM sakila.film
WHERE special_features LIKE ('%Behind the Scenes%');
-- there are 538 movies having "Benhind the Scenes" as part of their special features


  





    