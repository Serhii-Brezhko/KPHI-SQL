-- 1
select name, upper (name) as upcase_name
from cities
order by name ASC
limit 5 offset 5;

-- 2
select name, char_length (name) as length_name
from cities
where char_length (name) not in (8, 9, 10)
order by length_name ASC;

-- 3
select region, sum(population) as pop_sum
from cities
where region in ('C', 'S');

-- 4
select region, avg(population) as pop_region
from cities
where region in ('W');

-- 5
select region, count(name) as num_city
from cities
where region in ('E')