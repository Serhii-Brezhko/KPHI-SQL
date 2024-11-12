1) select *
from cities where name like '%ськ%';

2) select *
from cities where name like '%донец%';

3) select concat (name, ' ', '(' ,region, ')') as Cities
from cities where population > 100000
order by name ASC;

4) select name, population, population * 100 / 40000000 as pop_percent
from cities
order by population desc
limit 10;

5) select concat (name, ' ', '-', ' ', population * 100 / 40000000, '%') as Cities
from cities where population * 100 / 40000000 >= 0.1
order by population * 100 / 400000000 desc;