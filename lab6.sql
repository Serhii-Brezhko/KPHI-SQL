1) select cities.name as Cities, regions.name as Regions
from cities join regions on cities.region =
regions.uuid where population > 35000;

2) select cities.name as NordRegion
from cities join regions on cities.region =
regions.uuid where regions.name = 'Nord';