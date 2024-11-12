-- 1
select id, name, population
from cities
order by population desc
limit 10 offset 10;

-- 2
select id, name
from cities
order by name desc
limit 30;

-- 3
select *
from cities
order by region, population desc;

-- 4
select distinct region
from cities;

-- 5
select region, name
from cities
order by region desc, name desc;