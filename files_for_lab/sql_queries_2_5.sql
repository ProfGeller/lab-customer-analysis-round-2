use sakila;
#Select all the actors with the first name ‘Scarlett’.
select a.first_name, a.last_name
from actor a
where a.first_name = 'Scarlett';

#How many films (movies) are available for rent and how many films have been rented?
select distinct count(f.film_id)
from film f;

select count(r.rental_id)
from rental r;

#What are the shortest and longest movie duration? Return the results as columns with the names  max_duration and min_duration.
select f.length, f.title
from film f
order by f.length desc
limit 1;

select f.length, f.title
from film f
order by f.length asc
limit 1;

#What's the average movie duration expressed in format (hours, minutes) Return the result as columns with the names hours and minutes?
select avg(f.length) as avg_length, floor(avg(f.length)/60) as hours, floor(avg(f.length)-floor(avg(f.length)/60)*60) as minutes
from film f;

#How many distinct (different) actors' last names are there?
select distinct count(a.last_name)
from actor a;

#Since how many days has the company been operating (check the DATEDIFF() function)? Hint: rental table
select datediff(max(r.rental_date),min(r.rental_date)) as operating
from rental r;

#date_format(convert(r.rental_date, datetime), "%M %D %Y")
#Show all rental information with additional columns month and weekday. (hint: DATE_FORMAT() ). Get 20 results.
select*, date_format(convert(r.rental_date, datetime), "%M") as months, date_format(convert(r.rental_date, datetime), "%W") as weekday
from rental r;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
# Not pretty but working 
Alter table rental 
add x_day Text(10);
Update rental
SET x_day = date_format(convert(rental_date, datetime), "%W");
UPDATE rental
SET  x_day = replace(x_day,'Monday', 'Weekday');
UPDATE rental
SET  x_day = replace(x_day,'Tuesday', 'Weekday');
UPDATE rental
SET  x_day = replace(x_day,'Wednesday', 'Weekday');
UPDATE rental
SET  x_day = replace(x_day,'Thursday', 'Weekday');
UPDATE rental
SET  x_day = replace(x_day,'Friday', 'Weekday');
UPDATE rental
SET  x_day = replace(x_day,'Saturday', 'Weekend');
UPDATE rental
SET  x_day = replace(x_day,'Sunday', 'Weekend');

#How many rentals were made in the last month of renting activity?
SELECT COUNT(RENTAL_ID) as total_rental 
from rental where date_format(convert(rental_date,datetime),'%b') = 'May':
