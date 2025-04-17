#!/bin/bash

CONTAINER_NAME=$1

if [ -z "$CONTAINER_NAME" ]; then
  echo "Usage: $0 <container_name>"
  exit 1
fi

CONTAINER_ID=$(docker ps -aqf "name=^$CONTAINER_NAME$")

if [ -z "$CONTAINER_ID" ]; then
  echo "No container found with the name: $CONTAINER_NAME"
  exit 1
fi

ENTRYPOINT=$(docker inspect -f '{{json .Config.Entrypoint}}' $CONTAINER_NAME)
WORKING_DIR=$(docker inspect -f '{{json .Config.WorkingDir}}' $CONTAINER_NAME)
CMD=$(docker inspect -f '{{json .Config.Cmd}}' $CONTAINER_NAME)
ENV=$(docker inspect --format='{{range .Config.Env}}{{println "-" .}}{{end}}' $CONTAINER_NAME)

echo "entrypoint: $ENTRYPOINT"
echo "working_dir: $WORKING_DIR"
echo "commands: $CMD"
echo "environment:"
echo "$ENV"
