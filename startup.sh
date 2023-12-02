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
    docker compose up -d
    cd ..
done

docker exec -u www-data nextcloud-app php /var/www/html/cron.php