--Polygon
--osm_waterareas/osm_waterareas
alter table osm_waterareas add column symbol_id text;

update osm_waterareas
set symbol_id='0';

update osm_waterareas
set symbol_id='2'
where type='water';

update osm_waterareas
set symbol_id='2'
where type='ocean';

update osm_waterareas
set symbol_id='4'
where type='forest';

update osm_waterareas
set symbol_id='4'
where type='wood';

update osm_waterareas
set symbol_id='8'
where type='cemetery';

update osm_waterareas
set symbol_id='8'
where type='common';

update osm_waterareas
set symbol_id='8'
where type='golf_course';

update osm_waterareas
set symbol_id='8'
where type='park';

update osm_waterareas
set symbol_id='8'
where type='pitch';

update osm_waterareas
set symbol_id='8'
where type='recreation_ground';

update osm_waterareas
set symbol_id='8'
where type='village_green';

update osm_waterareas
set symbol_id='6'
where type='school';

update osm_waterareas
set symbol_id='6'
where type='collage';

update osm_waterareas
set symbol_id='6 '
where type='university';
