create view points as
    select
        osm_id,
        name,
        place as type,
        z_order,
        population,
        way as geom
    from planet_osm_point
    where place is not null;
