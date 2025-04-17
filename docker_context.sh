#!/bin/bash

docker context ls
docker context show
docker context use $CONTEXT_NAME
docker context create $CONTEXT_NAME
docker context rm $CONTEXT_NAME
docker context inspect $CONTEXT_NAME
