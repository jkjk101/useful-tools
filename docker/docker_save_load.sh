#!/bin/bash

# exports complete image including all layers and metadata
docker save -o <export_path> <image_name>
docker load < <export_archive>