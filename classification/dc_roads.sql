/**
 * lv0 (visual level from lv to lv)
 */
select * into roads_lv0 from osm_raods 
where type in (
    '',
);

comment on table roads_lv0
is 'data for visual level from lv to lv';

create index "roads_lv0_geom_gist"
on roads_lv0
using gist(geom);


/**
 * lv1 (visual level from lv to lv)
 */
select * into roads_lv1 from osm_raods where 1<>1;

comment on table roads_lv1
is 'data for visual level from lv to lv';

insert into roads_lv1
select * from osm_roads
where type in (
    '',
);

create index "roads_lv1_geom_gist"
on roads_lv1
using gist(geom);


/**
 * lv2 (visual level from lv to lv)
 */
select * into roads_lv2 from osm_raods 
where type in (
    '',
);

comment on table roads_lv2
is 'data for visual level from lv to lv';

create index "roads_lv0_geom_gist"
on roads_lv2
using gist(geom);

