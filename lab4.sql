1) select name, upper (name) as name_upcase
from cities
order by name ASC
limit 5 offset 5;

2) select name, char_length (name) as name_length
from cities where char_length (name) not in (8, 9, 10);

3) select region, sum (population) as pop_region
from cities where region in ('C', 'S')
group by region
order by pop_region;

4) select region, avg (population) as pop_region
from cities where region in ('W');

5) select count (name)
from cities where region in ('E')
order by name ASC;