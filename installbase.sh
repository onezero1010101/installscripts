#!/bin/bash

su -
apt install open-vm-tools sudo curl -y

usermod -aG sudo $USER
