-- 1
select name, population
from cities
where population >= 1000000;

-- 2
select *
from cities
where region in ('E', 'W')
order by population desc;

-- 3
select *
from cities
where region in ('S', 'C', 'N')
and population > 500000;

-- 4
select *
from cities
where (population > 150000 and population < 350000)
and region in ('E', 'W', 'N')
order by name ASC
limit 20;

-- 5
select *
from cities
where region not in ('E', 'W') 
order by population desc
limit 10 offset 10;