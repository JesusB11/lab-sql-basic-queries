use sakila;
-- 1.- Display all available tables in the Sakila database.
show tables from sakila;

-- 2.- Retrieve all the data from the tables actor, film and customer.
select * from actor, film, customer;

select * from actor;

select * from film;

select * from customer;
-- 3.- Retrieve the following columns from their respective tables:
-- 3.1 Titles of all films from the film table
SELECT title from film;

-- 3.2 List of languages used in films, with the column aliased as language from the language table
select name 
from sakila.language
where language_id IN (SELECT language_id FROM film);

-- 3.3 List of first names of all employees from the staff table
select first_name from staff;

-- 4.- Retrieve unique release years.
select distinct release_year from film;

-- 5.- Counting records for database insights:
-- 5.1 Determine the number of stores that the company has.
select distinct count(store_id) from store;

-- 5.2 Determine the number of employees that the company has.
select count(staff_id) from staff;

-- 5.3 Determine how many films are available for rent and how many have been rented.

select count(distinct film_id) as available_movies from inventory
where inventory_id not in (select inventory_id from rental where return_date is null);

select count(inventory_id) as available_copies from inventory
where inventory_id not in (select inventory_id from rental where return_date is null);

select count(distinct film_id) as rented_films from inventory 
where inventory_id in (select inventory_id from rental where rental_date is not null);

select count(inventory_id) as copies_rented from rental where rental_date is not null;

-- 5.4 Determine the number of distinct last names of the actors in the database.
select count(distinct last_name) from actor;

-- 6.- Retrieve the 10 longest films.
select length from film order by length desc limit 10;

-- 7.- Use filtering techniques in order to 7.1 retrieve all actors with the first name "SCARLETT".
select first_name, last_name from actor where first_name like 'SCARLETT';