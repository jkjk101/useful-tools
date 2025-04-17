#!/bin/bash

CONTAINER_NAME=$1
ZIP_OPTION=$2

if [ -z "$CONTAINER_NAME" ]; then
  echo "Usage: $0 <container_name> [zip]"
  exit 1
fi

CONTAINER_ID=$(docker ps -aqf "name=^$CONTAINER_NAME$")

if [ -z "$CONTAINER_ID" ]; then
  echo "No container found with the name: $CONTAINER_NAME"
  exit 1
fi

DATE=$(date +%Y%m%d)

if [ "$ZIP_OPTION" == "zip" ]; then
  echo "Exporting container $CONTAINER_NAME to ${CONTAINER_NAME}_$DATE.tar.gz"
  docker export $CONTAINER_ID | gzip > ${CONTAINER_NAME}_$DATE.tar.gz
else
  echo "Exporting container $CONTAINER_NAME to ${CONTAINER_NAME}_$DATE.tar"
  docker export $CONTAINER_ID > ${CONTAINER_NAME}_$DATE.tar
fi

echo "Export complete."
