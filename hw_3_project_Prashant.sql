-- 1.  List the last names of actors (alphabetically), as well as how many actors have that last name.

select last_name, count (last_name) from actor group by last_name order by last_name



-- 2.  List last names of actors and the number of actors who have that last name, but only for names 
-- that are shared by at least three actors, sort so that last name with the highest number of actors appears at the top.

select last_name, count(*) as actor_count from actor group by last_name having count (*) >= 3 order by actor_count desc, last_name



-- 3.  List all comedy films (regardless of other genres) by displaying the title and film year and 
-- sort by revenue_mils so that the highest appears first.

select film_year, title, revenue_mils from movies where genre like '%Comedy%' and revenue_mils is not null order by revenue_mils desc



-- 4.  Display how many films there are in the database for each year. Output should only contain the
-- year and number of films with oldest films appearing first.

select film_year, count(*) as number_of_films from movies group by film_year order by film_year 



-- 5.  Show all directors who have directed more than 4 films. The output should contain their names and
-- number of films they have directed. The output should show directors with more films at the top, and if
-- there is a tie, sort alphabetically.

select director, count(*) as number_of_films from movies group by director having count(*)> 4 order by number_of_films desc, director asc



-- 6.  Display the highest revenue amount for each year – output should show the film_year and revenue_mils
-- and it should show oldest films first.

select film_year, max(revenue_mils) as revenue_amt from movies group by film_year order by film_year



-- 7.  List highest postal codes for all districts staring with either A, B, C, or D ordered by the starting letter.

select district, max (postal_code) as highest_postalcodes from address where district like 'A%' or district like 'B%' or district like 'C%' or district like 'D%' group by district order by left (district, 1)



-- 8.  Show the ID and average money spent, rounded to 3 decimal points, from 15 top spending customers 
-- (by average spent) that spent below 4.5 so that customers who spent more appear at the top.

select customer_id, round(avg(amount),3) from payment group by customer_id having avg(amount) < 4.5 order by avg(amount) desc limit 15


-- 9.  Show the total number of actors who share their last name with 3 or more other actors.

select count(*) as total_actors from actor where last_name in (select last_name from actor group by last_name having count (*) >= 4)


-- 10. Show the total revenue by month. Hint: Research “EXTRACT”.

select extract (month from payment_date) as month, sum (amount) as total_revenue from payment group by extract(month from payment_date) order by month

