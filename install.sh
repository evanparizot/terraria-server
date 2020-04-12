#!/bin/bash

sudo su
yum update
rpm --import "http://pool.sks-keyservers.net/pks/lookup?op=get&search=0x3fa7e0328081bff6a14da29aa6a19b38d3d831ef"
su -c 'curl https://download.mono-project.com/repo/centos6-stable.repo | tee /etc/yum.repos.d/mono-centos6-stable.repo'

yum install -y unzip mono-complete
wget https://github.com/Pryaxis/TShock/releases/download/v4.3.26/tshock_4.3.26.zip -O temp.zip && unzip temp.zip -d tshock && rm -y temp.zip

cd tshock && chmod +x TerrariaServer.exe
wget -P ./worlds/ https://evan-terraria.s3.us-east-2.amazonaws.com/Quarintina_Take_Two.wld
wget https://evan-terraria.s3.us-east-2.amazonaws.com/serverconfig.txt

su ec2-user
mono TerrariaServer.exe -config serverconfig.txt
