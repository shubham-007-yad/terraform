#!/bin/bash

set -e

apt-get update -y
apt-get install -y python3 python3-pip python3-venv git curl

cd /home/ubuntu

git clone https://github.com/shubham-007-yad/kubernetes.git project

cd /home/ubuntu/project/backend

echo 'MONGO_URI=${mongo_uri}' > .env

python3 -m venv venv
./venv/bin/pip install -r requirements.txt

nohup ./venv/bin/python app.py > /home/ubuntu/flask.log 2>&1 &