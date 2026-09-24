#!/bin/bash

set -e

apt-get update -y
apt-get install -y python3 python3-pip python3-venv git curl

curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
apt-get install -y nodejs

cd /home/ubuntu

git clone https://github.com/shubham-007-yad/kubernetes.git project

cd /home/ubuntu/project/backend

echo 'MONGO_URI=${mongo_uri}' > /home/ubuntu/project/backend/.env

python3 -m venv venv
./venv/bin/pip install -r requirements.txt

nohup ./venv/bin/python app.py > /home/ubuntu/flask.log 2>&1 &

cd /home/ubuntu/project/frontend

npm install

export BACKEND_URL=http://localhost:5000

nohup npm start > /home/ubuntu/express.log 2>&1 &