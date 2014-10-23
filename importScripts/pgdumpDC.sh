#!/usr/bin/env bash

# SEE:http://rainbow702.iteye.com/blog/1318741
# $1 : path of export dumped file.

pg_dump -h localhost -p 5432 -U postgres -W -t landusages_lv0 -F p -b -v -f "$1/landusages_lv0.bak" blur_dc
