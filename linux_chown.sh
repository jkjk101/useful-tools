#!/bin/bash

sudo chown -R $USER:$USER $DIRECTORY_PATH

# Verify ownership
ls -l $DIRECTORY_PATH