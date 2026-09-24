TERRAFORM DEVOPS ASSIGNMENT — PART 3

PROJECT OVERVIEW

This project deploys a containerized Flask and Express application on AWS using Terraform

The infrastructure includes ECR, VPC, public subnets, Internet Gateway, ECS Fargate, Application Load Balancer, security groups, IAM execution role and CloudWatch logs


TECHNOLOGIES USED

Terraform

AWS ECR

AWS ECS Fargate

AWS VPC

AWS Application Load Balancer

AWS IAM

AWS CloudWatch

Docker

Flask

Express.js

MongoDB


PROJECT STRUCTURE

Terraform_Assignment_Part3/

├── main.tf

├── variables.tf

├── outputs.tf

├── README.md

├── .terraform.lock.hcl

└── project/

    ├── backend/

    │   ├── app.py

    │   ├── data.json

    │   ├── Dockerfile

    │   └── requirements.txt

    └── frontend/

        ├── app.js

        ├── Dockerfile

        ├── package.json

        └── package-lock.json


PART 3 OBJECTIVE

Deploy the Flask backend and Express frontend as Docker containers on AWS ECS Fargate

Store Docker images in Amazon ECR

Create a custom VPC with two public subnets

Deploy an Application Load Balancer

Connect the ALB with both ECS services

Configure security groups and IAM permissions

Enable CloudWatch container logging


ECR REPOSITORIES

Flask repository

terraform-part3-flask

Express repository

terraform-part3-express


DOCKER IMAGE BUILD

Flask image was built using

docker build -t terraform-part3-flask ./project/backend

Express image was built using

docker build -t terraform-part3-express ./project/frontend


ECR LOGIN

AWS ECR login was performed using

aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 011356579600.dkr.ecr.ap-south-1.amazonaws.com


DOCKER IMAGE TAGGING

Flask image

docker tag terraform-part3-flask:latest 011356579600.dkr.ecr.ap-south-1.amazonaws.com/terraform-part3-flask:latest

Express image

docker tag terraform-part3-express:latest 011356579600.dkr.ecr.ap-south-1.amazonaws.com/terraform-part3-express:latest


DOCKER IMAGE PUSH

Flask image

docker push 011356579600.dkr.ecr.ap-south-1.amazonaws.com/terraform-part3-flask:latest

Express image

docker push 011356579600.dkr.ecr.ap-south-1.amazonaws.com/terraform-part3-express:latest


VPC NETWORKING

VPC CIDR

10.0.0.0/16

Public subnet A

10.0.1.0/24

Availability Zone

ap-south-1a

Public subnet B

10.0.2.0/24

Availability Zone

ap-south-1b

An Internet Gateway and public route table provide internet connectivity to the public subnets


SECURITY GROUPS

ALB security group allows HTTP traffic on port 80 and port 5000

ECS security group allows port 3000 from the ALB security group

ECS security group allows port 5000 from the ALB security group

ECS tasks can communicate on port 5000 for backend communication

ECS tasks have outbound internet access


ECS CLUSTER

Cluster name

terraform-part3-cluster

The application runs using AWS Fargate


FLASK ECS SERVICE

Service name

terraform-part3-flask-service

Container port

5000

The Flask container uses the Docker image stored in the Flask ECR repository

MongoDB connection is provided to the container through the MONGO_URI environment variable


EXPRESS ECS SERVICE

Service name

terraform-part3-express-service

Container port

3000

The Express container uses the Docker image stored in the Express ECR repository

The BACKEND_URL environment variable connects Express to the Flask backend through the ALB


APPLICATION LOAD BALANCER

ALB

terraform-part3-alb

Port 80 forwards traffic to the Express ECS service

Port 5000 forwards traffic to the Flask ECS service

Flask health check

/api

Express health check

/


CLOUDWATCH LOGGING

Flask logs

/ecs/terraform-part3-flask

Express logs

/ecs/terraform-part3-express

CloudWatch log retention is configured for 7 days


IAM

An ECS task execution role is created using Terraform

The AmazonECSTaskExecutionRolePolicy allows ECS to pull images from ECR and send container logs to CloudWatch


TERRAFORM DEPLOYMENT

Initialize Terraform

terraform init

Format Terraform files

terraform fmt

Validate configuration

terraform validate

Create execution plan

terraform plan

Deploy infrastructure

terraform apply


DEPLOYMENT VERIFICATION

Both ECS services were verified with one running task each

Flask service

terraform-part3-flask-service

Express service

terraform-part3-express-service

Both services reached ACTIVE status


APPLICATION VERIFICATION

Express application

http://terraform-part3-alb-1616021558.ap-south-1.elb.amazonaws.com

Flask API

http://terraform-part3-alb-1616021558.ap-south-1.elb.amazonaws.com:5000/api

The Flask API was successfully accessed through the Application Load Balancer

The application form was also tested and form submission successfully completed through the Express and Flask services


ARCHITECTURE

Internet

↓

Application Load Balancer

├── Port 80

│   └── Express ECS Service

│       └── Port 3000

│

└── Port 5000

    └── Flask ECS Service

        └── Port 5000

            └── MongoDB


AWS RESOURCES CREATED

ECR repositories

VPC

Two public subnets

Internet Gateway

Public route table

Two security groups

ECS cluster

Two ECS task definitions

Two ECS services

Application Load Balancer

Two target groups

Two ALB listeners

IAM execution role

CloudWatch log groups


GITHUB REPOSITORY

git@github.com:shubham-007-yad/terraform.git


SUBMISSION NOTE

Sensitive files such as terraform.tfvars, Terraform state files and local credentials are excluded from the submission

The project source code and Terraform configuration files are included in this folder