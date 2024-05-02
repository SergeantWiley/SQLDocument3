select *
from address

select *
from customer

-- Question 1 -- Completed
SELECT customer.first_name, customer.last_name, address.district
FROM customer
JOIN address
ON address.address_id = customer.address_id
WHERE address.district = 'Texas';


-- Question 2 -- Completed
select customer.name, payment.customer_id, amount
from customer
left join payment
on customer.customerid  = payment.customer_id
where amount > 6.99

--Question 3 -- Completed
select name, customerid
from customer
where customerid in (
	select customer_id
	from payment
	group by customer_id 
	having sum(amount) > 175
)
-- Returns 0. To verify, I ran the code below to see how much everyone payed

select customer.name, payment.customer_id, sum(payment.amount)
from customer
left join payment
on customer.customerid  = payment.customer_id
group by  customer.name, payment.customer_id 


SELECT customer.first_name, customer.last_name
FROM customer
join address on customer.address_id = address.address_id 
join city on address.city_id = city.city_id
join country on city.country_id = country.country_id
where country = 'Nepal'

select * from city

-- Question 5 -- Completed
select staff.staff_id, staff.first_name, staff.last_name, count(staff.staff_id) 
from staff
left join payment
on staff.staff_id = payment.staff_id
group by staff.first_name, staff.last_name, staff.staff_id

-- Question 6 -- Completed
select rating, count(film_id)
from film
group by rating
-- Returns
-- R: 195
-- PG-13: 223
-- G: 178
-- NC-17: 210
-- PG: 194

-- Question 7 -- Completed
select name, customerid
from customer
where customerid in (
	select customer_id 
	from payment
	where amount > 6.99
	group by customer_id
	having count(payment_id) > 1
)

-- Question 8 -- Completed/Questioned
-- Similear to Question 4, I did CTRL + F
-- It does not so no body lives in it. Just to be sure, I ran the code
select amount
from payment
where amount = 0.00
