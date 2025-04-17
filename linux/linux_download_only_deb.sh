#!/bin/bash

sudo apt-get install --download-only <package name>
    # OR (if the package is already installed and the deb is not in the cache)
sudo apt-get install --reinstall --download-only <package name>
    # OR
download the package from the repository and install it manually:
    # visit debian packages or another repository site to find the deb file
    # download it using 
    wget <url>

# verify:
dpkg -L <package name>
ls /var/cache/apt/archives/

# send to remote host without internet connection within the same network:
scp package_name.deb username@remote_host:/path/to/destination/

# install the package on the remote host:
sudo dpkg -i package_name.deb
