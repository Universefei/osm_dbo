create view waterareas as 
    select
        osm_id,
        name,
        "natural" as type,
        way as geom
    from planet_osm_polygon
    where "natural" in ('water','reservoir','riverbank','river','waterway');
/*
 * natural is a reserverd keyworld of postgreSQL, so using a quote to mark that situation
 */
