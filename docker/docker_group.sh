#!/bin/bash

# add user to docker group
sudo usermod -aG docker $USER
newgrp docker

# logout of current session
exit

# check if user is in docker group
groups $USER | grep --color=auto docker
