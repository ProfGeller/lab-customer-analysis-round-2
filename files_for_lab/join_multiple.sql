#Q.0 Inspect the database structure and find the best-fitting table to analyse for the next task.
use sakila;

#Q.1 Using multiple JOIN() clauses display the store ID, city, and country of each store.
select s.store_id, c.city, co.country
from store s
join address a
on s.address_id = a.address_id
join city c
on a.city_id = c.city_id
join country co
on c.country_id = co.country_id;

#Q.2 Display the total payment amount for each store.
select sto.store_id as store_no, sum(pay.amount) as total_payments
from store sto
join customer cus
on sto.store_id = cus.store_id
join payment pay 
on cus.customer_id = pay.customer_id
group by sto.store_id;

#Q.3 What is the average film length per each category? Which category of films are the longest?
select ca.name, avg(fi.length) as avg_length
from film fi
join film_category fc
on fi.film_id = fc.film_id
join category ca 
on fc.category_id = ca.category_id
group by ca.name
order by avg_length desc;

#Q.4 Display the 2 most frequently rented movies in descending order.
select f.title, count(r.rental_id) as rent_frequency
from film f
join inventory i
on f.film_id = i.film_id
join rental r 
on i.inventory_id = r.inventory_id
group by f.film_id
order by rent_frequency desc;

#Q.5 Display the top 5 categories with highest revenue (payment amount) in descending order.
select ca.name, sum(pa.amount) as revenue
from category ca
join film_category fc
on ca.category_id = fc.category_id
join film fi
on fc.film_id = fi.film_id
join inventory inv
on fi.film_id = inv.film_id
join rental re
on inv.inventory_id = re.inventory_id
join payment pa
on re.rental_id = pa.rental_id
group by ca.name
order by revenue desc;

#Q.6 Is the Academy Dinosaur movie available for rent from Store 1? If yes, display the title, store_id and inventory_id of the available copies of that movie.
select fi.title, st.store_id, inv.inventory_id
from store st
join inventory inv
on st.store_id = inv.store_id
join film fi
on inv.film_id = fi.film_id
having fi.title = 'Academy Dinosaur' and st.store_id = 1;

