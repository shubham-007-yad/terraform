#!/bin/bash

set -e

apt-get update -y
apt-get install -y git curl

curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
apt-get install -y nodejs

cd /home/ubuntu

git clone https://github.com/shubham-007-yad/kubernetes.git project

cd /home/ubuntu/project/frontend

npm install

export BACKEND_URL=http://${backend_private_ip}:5000

nohup npm start > /home/ubuntu/express.log 2>&1 &