#!/bin/bash
# Parse arguments by shifting through them. Currently just used for help.
while :; do
    case $1 in
        -h|-help|--h|--help) showHelp=true           
        ;;
        *) break
    esac
    shift
done

if [ $showHelp ]; then
    echo "HELP"
    exit 0
fi

# default services to start without command line argument
services=("proxy" "authentik" "nextcloud")

# Use command line arguments instead of default if there are variables given
if [ $# -ne 0 ]; then
    services=("$@")
fi

# initialize the docker swarm
# docker swarm init
# JOIN_COMMAND = docker swarm join-token worker

# -> after the proxy, we can start the order services in arbitrary order
for SERVICE in "${services[@]}"
do
    echo "starting $SERVICE";

    # -> cd in to service folder
    pushd $SERVICE

    # -> make the environment variables available
    if [ -f "./.env" ]; then
        set -a && . .env && set +a
        echo "in if $PG_PASS2"
    fi

    echo "out of if $PG_PASS"

    # -> start the service and join the swarm
    docker stack deploy -c docker-compose.yml $SERVICE

    # -> if there is an additional startup script, run it
    if [ -f "./startup.sh" ]; then
        chmod +x ./startup.sh
        ./startup.sh
    fi
    # -> cd out of the service folder
    popd
done