#!/bin/bash            
echo 127.0.0.1 $(hostname) >> /etc/hosts
export DEBIAN_FRONTEND=noninteractive
# User Creation
useradd user -m -U -s /bin/bash
usermod -aG sudo user
echo "root:SomethingSecret" | chpasswd
echo "user:$password" | chpasswd
