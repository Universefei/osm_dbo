/***************************************************************************/
/*                    osm_roads     lv14                                   */
/***************************************************************************/
/* replicate table and operate on the new table later */
select * into osm_roads_lv14_blured_5 from osm_roads_blured_5;
/* using GDAL to extract  point will generate new __gid collumn, not need here */
alter table osm_roads_lv14_blured_5 drop column __gid;

/* using select to create new table can not copy constraints and indexes, 
 * must create then manually
 */
alter table osm_roads_lv14_blured_5 add constraint "osm_roads_lv14_blured_5_pkey" primary key(gid);

create index "osm_roads_lv14_blured_5_index"
on osm_roads_lv14_blured_5_index using gist(geom);

/* delete feature do not need to render in this level */
begin;
    delete from osm_roads_lv14_blured_5_index 
    where type not in ( 'motorway',
                        'trunk',
                        'primary',
                        'secondary',
                        'motorway_link',
                        'trunk_link',
                        'primary_link',
                        'secondary_link',
                        'tertiary',
                        'tertiary_link',
                        'unclassified',
                        'residential',
                        'living-street',
                        'service',
                        'pedestrian',
                        'track',
                        'footway',
                        'bridleway');
commit;

/***************************************************************************/
/*                    osm_roads     lv12                                   */
/***************************************************************************/
/* replicate table and operate on the new table later */
select * into osm_roads_lv12_blured_5 from osm_roads_blured_5;
/* using GDAL to extract  point will generate new __gid collumn, not need here */
alter table osm_roads_lv12_blured_5 drop column __gid;

/* using select to create new table can not copy constraints and indexes, 
 * must create then manually
 */
alter table osm_roads_lv12_blured_5 add constraint "osm_roads_lv12_blured_5_pkey" primary key(gid);

create index "osm_roads_lv12_blured_5_index"
on osm_roads_lv12_blured_5_index using gist(geom);

/* delete feature do not need to render in this level */
begin;
    delete from osm_roads_lv12_blured_5_index 
    where type not in ( 'motorway',
                        'trunk',
                        'primary',
                        'secondary',
                        'motorway_link',
                        'trunk_link',
                        'primary_link',
                        'secondary_link',
                        'tertiary',
                        'tertiary_link',
                        'unclassified',
                        'residential',
                        'living-street');
                        
commit;

/***************************************************************************/
/*                    osm_roads     lv11                                   */
/***************************************************************************/
/* replicate table and operate on the new table later */
select * into osm_roads_lv11_blured_5 from osm_roads_blured_5;
/* using GDAL to extract  point will generate new __gid collumn, not need here */
alter table osm_roads_lv11_blured_5 drop column __gid;

/* using select to create new table can not copy constraints and indexes, 
 * must create then manually
 */
alter table osm_roads_lv11_blured_5 add constraint "osm_roads_lv11_blured_5_pkey" primary key(gid);

create index "osm_roads_lv11_blured_5_index"
on osm_roads_lv11_blured_5_index using gist(geom);

/* delete feature do not need to render in this level */
begin;
    delete from osm_roads_lv11_blured_5_index 
    where type not in ( 'motorway',
                        'trunk',
                        'primary',
                        'secondary');
                        
commit;

/***************************************************************************/
/*                    osm_roads     lv8                                   */
/***************************************************************************/
/* replicate table and operate on the new table later */
select * into osm_roads_lv8_blured_5 from osm_roads_blured_5;
/* using GDAL to extract  point will generate new __gid collumn, not need here */
alter table osm_roads_lv8_blured_5 drop column __gid;

/* using select to create new table can not copy constraints and indexes, 
 * must create then manually
 */
alter table osm_roads_lv8_blured_5 add constraint "osm_roads_lv8_blured_5_pkey" primary key(gid);

create index "osm_roads_lv8_blured_5_index"
on osm_roads_lv8_blured_5_index using gist(geom);

/* delete feature do not need to render in this level */
begin;
    delete from osm_roads_lv8_blured_5_index 
    where type not in ( 'motorway',
                        'trunk',
                        'primary',
                        'secondary');
                        
commit;

