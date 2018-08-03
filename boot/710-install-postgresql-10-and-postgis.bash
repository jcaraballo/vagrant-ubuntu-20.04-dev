#!/bin/bash

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
&& echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list \
&& apt-get update \
&& apt-get install -y \
    postgresql-10 \
    postgresql-10-postgis-2.4 \
    postgresql-10-postgis-scripts \
    postgis

