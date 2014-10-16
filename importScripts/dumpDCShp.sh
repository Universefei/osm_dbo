#!/usr/bin/env bash

# usage example
# $1 : host to import data to
# $2 : shapefiles' directory path
# ->
# -> ./dumpdcOSM.sh 192.168.3.137 ~/gisData/dc
# ->

psql -h $1 -p 5432 -U postgres -l |grep dc_osm_orig &> /dev/null
if [[ $? != 0 ]]; then
    psql -h $1 -p 5432 -U postgres -c "create database dc_osm_orig"
    psql -h $1 -p 5432 -U postgres -d dc_osm_orig -c "create extension postgis"
else
    while true
    do
        read -p "Database dc_osm_orig at $1 already exsit, override it? [y/n]" RESP
        case $RESP in
            Y|y)
                echo "will override dc_osm_origin"
                psql -h $1 -p 5432 -U postgres -d dc_osm_orig -c "create extension postgis"
                break
                ;;
            N|n)
                exit
                break
                ;;
            *)
                echo "input error"
                continue
                ;;
        esac
    done
fi

for SHP in $2/*.shp
do
    ogr2ogr -append -f PostgreSQL -t_srs EPSG:4326 PG:"host='$1' port='5432' user='postgres' password='postgres' dbname='dc_osm_orig'" -s_srs EPSG:900913  $SHP
done
