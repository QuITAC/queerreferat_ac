#!/bin/bash
# initialize the docker swarm
docker swarm init
# JOIN_COMMAND = docker swarm join-token worker

# now start the services
# -> the proxy is the first service to start
cd proxy
docker stack deploy -c docker-compose.yml proxy
cd ..

# -> after the proxy, we can start the order services in arbitrary order
for SERVICE in $(git submodule | cut -d " " -f 3 | grep -v proxy)
do
    # -> cd in to service folder
    cd $SERVICE

    # -> make the environment variables available
    if [ -f "./.env" ]; then
        set -a && . .env && set +a
    fi

    # -> start the service and join the swarm
    docker stack deploy -c docker-compose.yml $SERVICE

    # -> if there is an additional startup script, run it
    if [ -f "./startup.sh" ]; then
        chmod +x ./startup.sh
        ./startup.sh
    fi
    # -> cd out of the service folder
    cd ..
done