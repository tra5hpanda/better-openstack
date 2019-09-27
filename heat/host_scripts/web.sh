#!/bin/bash
echo 127.0.0.1 $(hostname) >> /etc/hosts
sed -i's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get install -y nginx
#SETUP WEBPAGE
cat <<EOF > var/www/html/index.html
<HTML>
<HEAD>
<TITLE>BSafe Company Internal Employee Resources</TITLE>
</HEAD>
<H1>BSafe Company Internal Employee Resources</H1>
<BODY BGCOLOR="b6f442">
</BODY>
</HTML>
EOF
#CREATE NETCAT LISTENERS
touch /Halo.txt
chmod 2302 /Halo.txt
echo "Halo hosted on a serverX" > /Halo.txt
touch /Chat.txt
chmod 6666 /Chat.txt
echo "Try Server X for Chat" > /Chat.txt
#CREATE USER
useradd webadmin -m -U -s /bin/bash
usermod -aG sudo w
echo "root:$password" | chpasswd
echo "webadmin:http" | chpasswd

