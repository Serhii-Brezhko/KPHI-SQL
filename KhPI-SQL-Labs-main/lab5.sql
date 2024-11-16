-- 1
select region, sum(population) as pop_region
from cities
group by region;

-- 2
select region, sum(population) as pop_region
from cities
group by region
having count(name) >= 10;

-- 3
select name, population
from cities
where region in (
   select uuid
   from regions
   where area_quantity >= 5)
order by population desc
limit 5 offset 10;

-- 4
select region, sum(population) as pop_region
from cities
where name in (
   select name
   from cities
   where population > 300000)
group by region;

-- 5
select name, population
from cities
where region in (
   select uuid
   from regions
   where area_quantity <= 5)
and (population < 150000 or population > 500000);