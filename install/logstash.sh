#!/bin/bash

set -eu

COff='\e[0m'       # Text Reset
BYellow='\e[1;33m'      # Yellow
BCyan='\e[1;36m'        # Cyan


echo -e "${BYellow}[Info] add logstash repository${COff}"
cat > /etc/yum.repos.d/logstash.repo << EOF
[logstash-1.4]
name=logstash repository for 1.4.x packages
baseurl=http://packages.elasticsearch.org/logstash/1.4/centos
gpgcheck=1
gpgkey=http://packages.elasticsearch.org/GPG-KEY-elasticsearch
enabled=1
EOF

echo -e "${BYellow}[Info] Install${COff}"
yum -y install logstash
