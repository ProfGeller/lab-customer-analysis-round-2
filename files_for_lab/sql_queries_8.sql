use sakila;
#0 Inspect the database structure and find the best-fitting table to analyse for the next task.
# seems to be film table

#1 Use the RANK() and the table of your choice rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
select f.title, f.length, rank() over (partition by f.release_year order by f.length desc) as 'Rank'
from film f
where length is not null or ' ';

#2 Build on top of the previous query and rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, rating and the rank.
select f.title, f.length, rating, rank() over (partition by f.rating order by f.length desc) as 'Rank'
from film f
where length is not null or ' ';

#3 How many films are there for each of the categories? Inspect the database structure and use appropriate join to write this query.
select category_id, count(*) as no_of_films from film fi
join film_category fc
on fi.film_id = fc.film_id
group by fc.category_id;


#4 Which actor has appeared in the most films?
select actor_id, count(*) as appearance 
from film_actor fa
left join film fi
on fa.film_id = fi.film_id
group by (actor_id)
order by appearance desc; 

# extract actor name
# 4.1 With two left joins,
# Which actor has appeared in the most films?
select ac.actor_id as id, ac.first_name, ac.last_name, count(*) as appearances
from actor ac
left join film_actor fa
on ac.actor_id = fa.actor_id
group by ac.actor_id
order by appearances desc; 

#5 Most active customer (the customer that has rented the most number of films)
select c.customer_id, c.last_name, c.first_name, count(*) as rentals 
from customer c
left join rental r
on c.customer_id = r.customer_id
group by (customer_id)
order by rentals desc; 

#6 Bonus: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. Give it a try. We will talk about queries with multiple join statements later in the lessons.
select fi.title, count(*) as no_of_rentals
from film fi
left join inventory iv
on fi.film_id = iv.film_id
left join rental re
on iv.inventory_id = re.inventory_id
group by (fi.film_id)
order by no_of_rentals desc
limit 1;