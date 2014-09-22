create view roads as
    select 
        osm_id,
        bridge,
        ref,
        tunnel,
        oneway,
        z_order,
        highway as type
        class,
        way as geom
    from planet_osm_roads
    --where highway<>NULL; incorrectly!
    where highway is not null;
