
/**
 * landusage lv7 - lv11 
 */
select * into landusages_lv0 from osm_landusages where 1<>1;
comment on table landusages_lv0
is 'extract data from osm_landusages for visual level from lv7 to lv11';

insert into landusages_lv0 
select * from osm_landusages
where type in ( 'recreation_ground', 
                'cemetery', 
                'common', 
                'park', 
                'village_green', 
                'pitch', 
                'golf_course', 
                'wood', 
                'forest');

create index "landusages_lv0_geom_gist"
on landusages_lv0
using gist(geom);


/**
 * landusage lv12 - lv18 
 */

/* create and copy table definition */
select * into landusages_lv1 from osm_landusages where 1<>1; 

/* add comment on this table */
comment on table landusages_lv1
is 'extract data from osm_landusages for visual level from lv12 to lv18';

/* insert data through filter from another table */
insert into landusages_lv1 
select * from osm_landusages
where type in { 'recreation_ground', 
                'cemetery', 
                'common', 
                'park', 
                'village_green', 
                'pitch', 
                'golf_course', 
                'wood', 
                'forest',
                'school',
                'university',
                'college'};

/* create gist index on geom column */
create index "landusages_lv1_geom_gist"
on landusages_lv1
using gist(geom);
