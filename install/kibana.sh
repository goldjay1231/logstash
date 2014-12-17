#!/bin/bash

set -eu

COff='\e[0m'            # Text Reset
BYellow='\e[1;33m'      # Yellow
BCyan='\e[1;36m'        # Cyan

# Repository URL: http://www.elasticsearch.org/overview/kibana/installation/
# Version:
# 3.1.2: https://download.elasticsearch.org/kibana/kibana/kibana-3.1.2.tar.gz
# 4 beta 3: https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-beta3.tar.gz
URL=http://10.32.78.252/files/kibana/kibana-4.0.0-beta3.tar.gz

echo -e "\n${BYellow}[Info] install${COff}"
mkdir -p /opt/kibana
wget $URL
tar zxvf kibana-*.tar.gz -C /opt/kibana

echo -e "\n${BCyan}[Info] execute bin/kibana to start${COff}"
echo -e "\n${BCyan}[Info] http://localhost:5601${COff}"
