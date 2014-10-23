#!/usr/bin/env bash

#pg_restore -h localhost -p 5432 -U postgres -W -d blur_dc -v "landusages_lv0.bak"

psql -h localhost -p 5432  -U postgres -W -f "landusages_lv0.bak"
