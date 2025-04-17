#!/bin/bash

sudo systemctl stop service
sudo systemctl disable service
sudo rm /etc/systemd/system/servicefile.service
sudo systemctl daemon-reload
sudo systemctl reset-failed
systemctl list-units --type=service
ls -l /etc/systemd/system/