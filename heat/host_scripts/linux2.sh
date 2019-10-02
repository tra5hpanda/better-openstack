#!/bin/bash            
echo 127.0.0.1 $(hostname) >> /etc/hosts
export DEBIAN_FRONTEND=noninteractive
# User Creation
echo "CREATE USER"
useradd user -m -U -s /bin/bash
usermod -aG sudo user
echo "root:SomethingSecret" | chpasswd
echo "user:Security!" | chpasswd
nc -l -p $openport3
nc -l -p $openport4
