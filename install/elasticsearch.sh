#!/bin/bash

set -eu

COff='\e[0m'       # Text Reset
BYellow='\e[1;33m'      # Yellow
BCyan='\e[1;36m'        # Cyan


echo -e "\n${BYellow}[Info] add elastic repository${COff}"
cat > /etc/yum.repos.d/elasticsearch.repo << EOF
[elasticsearch-1.4]
name=Elasticsearch repository for 1.4.x packages
baseurl=http://packages.elasticsearch.org/elasticsearch/1.4/centos
gpgcheck=1
gpgkey=http://packages.elasticsearch.org/GPG-KEY-elasticsearch
enabled=1
EOF

echo -e "\n${BYellow}[Info] install${COff}"
yum -y install elasticsearch

echo -e "\n${BYellow}[Info] config runlevel${COff}"
chkconfig --add elasticsearch
chkconfig elasticsearch on
chkconfig --list elasticsearch

echo -e "\n${BYellow}[Info] install plugin kopf${COff}"
cd
wget http://10.32.78.252/files/elasticsearch/elasticsearch-kopf-master.zip
/usr/share/elasticsearch/bin/plugin --install lmenezes/elasticsearch-kopf --url file:///root/elasticsearch-kopf-master.zip

echo -e "\n${BYellow}[Info] start${COff}"
service elasticsearch start

echo -e "\n${BCyan}[Info] http://localhost:9200${COff}"
echo -e "${BCyan}[Info] plugin: http://10.62.166.130:9200/_plugin/kopf${COff}"
