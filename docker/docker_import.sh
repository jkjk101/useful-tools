#!/bin/bash

# file structure:
# ├── import_images.sh
# ├── xxx_dockerfile
# │   ├── Dockerfile
# │   └── images
# │       └── xxx_20240708.tar
# ├── yyy_dockerfile
# │   ├── Dockerfile
# │   └── images
# │       └── yyy_20240708.tar.gz
# ├── zzz_dockerfile
# │   └── images
# │       └── zzz_20240708.tar

# validate sudo
if [[ $EUID > 0 ]]; then
    echo "This script requires root privileges. Please run with sudo."
    exit
fi

# validate tag 
if [ -z "$1" ]; then
    echo "No tag provided."
    exit
else
    IMAGE_TAG=$1
    echo ">>> Image Tag: $IMAGE_TAG"
fi


for image_tar in *_dockerfile/images/*.tar *_dockerfile/images/*.tar.gz; do
    image_tar_name=$(basename $image_tar | cut -d. -f1)
    to_docker_image_name=$image_tar_name:$IMAGE_TAG
    
    existing_image=$(docker image ls $to_docker_image_name -q)
    if [ -z $existing_image ]; then
        echo ">>> Importing $to_docker_image_name"
        if [[ $image_tar == *.tar.gz ]]; then
            zcat "$image_tar" | docker import - "$to_docker_image_name"
        else
            docker import - "$to_docker_image_name" < "$image_tar"
        fi

    else
        echo ">>> Skipping $to_docker_image_name as it already exists (Image ID: $existing_image)"
    fi
done

