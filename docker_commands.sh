#!/bin/bash

# stop all containers
docker stop $(docker ps -aq)

# stop and remove all containers
docker rm -f $(docker ps -aq)

# remove all images
docker rmi $(docker images -q)

# remove all images without a tag (dangling images)
docker image prune -af

# execute a bash shell in a running container
docker exec -it $CONTAINER_NAME bash

# attach to a running container
docker attach $CONTAINER_NAME

# output the logs of a container
docker logs $CONTAINER_NAME
# output the logs of a container in real-time
docker logs -f $CONTAINER_NAME
# output the logs of a container with timestamps
docker logs --timestamps $CONTAINER_NAME

# compose up
docker compose up -d
# compose down
docker compose down

