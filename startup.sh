#!/bin/bash
# untested

# start proxy first
cd proxy
docker compose up -d
cd ..

# iterate through all submodules and exclude proxy
for SERVICE in $(git submodule | cut -d " " -f 3 | grep -v proxy)
do
    cd $SERVICE
    chmod +x ./startup.sh
    ./startup.sh
    cd ..
done