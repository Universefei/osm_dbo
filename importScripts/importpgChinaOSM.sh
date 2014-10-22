#!/usr/bin/env bash

# usage example
# $1 : host to import data to
# $2 : osm data path
# ->
# -> ./dumpChinaOSM.sh 192.168.3.137 ~/gisData/china-latest.osm.pbf
# ->

psql -h $1 -p 5432 -U postgres -l |grep china_osm_orig &> /dev/null
if [[ $? != 0 ]]; then
    psql -h $1 -p 5432 -U postgres -c "create database china_osm_orig"
    psql -h $1 -p 5432 -U postgres -d china_osm_orig -c "create extension postgis"
else
    while true
    do
        read -p "Database china_osm_orig at $1 already exsit, override it? [y/n]" RESP
        case $RESP in
            Y|y)
                echo "will override china_osm_origin"
                psql -h $1 -p 5432 -U postgres -d china_osm_orig -c "create extension postgis"
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

osm2pgsql -H $1 -P 5432 -U postgres -W -d china_osm_orig -c -l -C 800 $2

