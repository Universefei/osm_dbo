#!/usr/bin/env bash

# usage example
# ->
# -> ./osm2pg 3.202 blur_dc planet_latest_china.osm.pbf.
# ->

osm2pgsql -H 192.168.$1 -P 5432 -U postgres -W -d $2 -c -l -C 6000 $3
