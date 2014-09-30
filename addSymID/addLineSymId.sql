--Line
--osm_roads
alter table osm_roads add column symbol_id text;

update osm_roads
set symbol_id='0';

update osm_roads
set symbol_id='30 25'
where type='tertiary';

update osm_roads
set symbol_id='31 26'
where type='primary_link';

update osm_roads
set symbol_id='32 27'
where type='trunk_link';

update osm_roads
set symbol_id='32 27'
where type='motorway_link';

update osm_roads
set symbol_id='30 25'
where type='residential';

update osm_roads
set symbol_id='31 26'
where type='secondary_link';

update osm_roads
set symbol_id='30 25'
where type='tertiary_link';

update osm_roads
set symbol_id='30 25'
where type='living_street';

update osm_roads
set symbol_id='30 25'
where type='unclassified';

update osm_roads
set symbol_id='33 28'
where type='secondary';

update osm_roads
set symbol_id='33 28'
where type='primary';

update osm_roads
set symbol_id='34 29'
where type='trunk';

update osm_roads
set symbol_id='34 29'
where type='motorway';

update osm_roads
set symbol_id='36'
where type='service';

update osm_roads
set symbol_id='36'
where type='pedestrian';

