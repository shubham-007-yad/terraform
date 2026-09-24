GITHUB LINK - https://github.com/shubham-007-yad/kubernetes.git


-              git@github.com:shubham-007-yad/kubernetes.git



This is a simple Kubernetes project where I used Flask, Node.js, Docker and Kubernetes with Minikube

The project has one Flask backend and one Node.js frontend with the following:

frontend - show the form and send data to backend
backend - receive data and store it in mongo
'/api/' - reads data from data.json and return it as json
'/success' - show the success page after submission

project structure -

flask-git-assignment/

#main/root folder
-backend(folder)
-frontend(folder)
-k8s(folder)
-docker-compose.yaml
-README.md
-.gitignore

-backend(folder) inside this folder
-app.py
-data.json
-requirements.txt
-Dockerfile
-templates(folder)

-frontend(folder) inside this folder
-app.js
-package.json
-package-lock.json
-Dockerfile
-public(folder)

-k8s(folder) inside this folder
-backend-deployment.yaml
-backend-service.yaml
-frontend-deployment.yaml
-frontend-service.yaml


CREATE VIRTUAL ENV :- 

                -python3 -m venv venv
then activate - source venv/bin/activate

after that 

you have to download requirement which contain packages which are necessary 

pip install -r backend/requirements.txt

after that you can access flask app 


python3 backend/app.py


START MINIKUBE (minikube start ):

                -minikube start --driver=docker

then deploy the kubernetes files -

kubectl apply -f k8s/backend-deployment.yaml
kubectl apply -f k8s/backend-service.yaml
kubectl apply -f k8s/frontend-deployment.yaml
kubectl apply -f k8s/frontend-service.yaml

after that you can check pods -

kubectl get pods

and check services -

kubectl get services


like this your all project frontend and backend will be in kubernate 


    ALSO you can access detail data on dashboard 


    minikube dashboard ( this is command for terminal to access dashboard )