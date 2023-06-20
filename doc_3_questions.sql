--Week 5 - Wednesday Questions
-- 1. List all customers who live in Texas (use JOINs)
select customer.first_name, customer.last_name, city
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
where city = 'Dallas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
select customer.first_name, customer.last_name, amount
from customer
right join payment
on customer.customer_id = payment.customer_id
where amount > 6.99
order by customer.last_name;

-- 3. Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having SUM(amount) > 175
	order by SUM(amount)
)
group by first_name, last_name;

-- 4. List all customers that live in Nepal (use the city table)
select customer_id, customer.first_name, customer.last_name, country
from customer
right join address
on customer.address_id = address.address_id
right join city
on address.city_id = city.city_id
right join country
on city.country_id = country.country_id
where country = 'Nepal';

-- 5. Which staff member had the most transactions?
select staff.staff_id, staff.first_name, staff.last_name, COUNT(payment_id)
from staff
right join payment
on staff.staff_id = payment.staff_id
group by staff.staff_id
order by staff.staff_id;

-- 6. How many movies of each rating are there?
select rating, COUNT(film_id)
from film
group by rating
order by COUNT(film_id);

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
)
order by customer_id;

-- 8. How many free rentals did our stores give away?
select COUNT(rental_id)
from payment
where amount < 1;
-- our stores apparently owe a lot of money to customers...that's not a good sign...


