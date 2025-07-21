#!/bin/bash

sudo ip route add default via 192.168.0.5 dev <interface> metric 200
sudo ip route replace default via 192.168.0.5 dev <interface>
ip route
