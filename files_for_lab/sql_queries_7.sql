use sakila;
#In the actor table, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
select count(*) as no_occurence, last_name
from actor a
group by a.last_name
having count(*) = 1;

#Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once.
select count(last_name) as no_occurence, last_name
from actor a
group by a.last_name
having count(*) > 1;


#Using the rental table, find out how many rentals were processed by each employee.
select count(*), staff_id
from rental r
group by r.staff_id;

#Using the film table, find out how many films were released each year
select count(*) as no_of_releases , f.release_year
from film f
group by f.release_year;

#Using the film table, find out for each rating how many films were there.
select count(*) as no_of_rating, f.rating
from film f
group by f.rating;

#What is the average length of films for each rating? Round off the average lengths to two decimal places.
select rating, round(avg(length),2) as avg_length from film
group by rating;

#Which kind of movies (based on rating) have an average duration of two hours or more?
select rating, round(avg(length),2) as avg_length from film
group by rating
having avg_length > 120;