use sakila

#Get the unique release years.
select * from film;
select release_year from film;

#Get all films with ARMAGEDDON in the title.
SELECT * FROM film
WHERE title like 'armageddo%'

#Get all films which title ends with APOLLO.
SELECT * FROM film
WHERE title like '%apollo';

#Get 10 the longest films.
select * from film
order by length desc
limit 10;

#How many films include Behind the Scenes content?
select count(film_id) as tot_movie_extras from film where special_features like '%Behind the Scenes';
 
#Drop column picture from staff.
ALTER TABLE staff DROP picture;
select * from staff;

#A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
INSERT INTO staff (staff_id, first_name, last_name, address_id, store_id, username, password)
VALUES (3, 'Tammy', 'Sanders', 5, 2,'tammy', 'skjfifdiabsifasvifb' );

#Add a rental for movie "Academy Dinosaur" by the customer "Charlotte Hunter" from employee Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information in other tables. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
select * from film
where title like 'Academy%';
select * from inventory
where film_id = 1;

INSERT INTO rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES (99999999, '2005-05-24 22:53:30', 3, 130, '2005-05-26 22:04:30',1, '2005-05-26 22:04:30');