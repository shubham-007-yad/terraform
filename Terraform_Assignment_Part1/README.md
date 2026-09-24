TERRAFORM DEVOPS ASSIGNMENT - PART 1

OBJECTIVE

Deploy a Flask backend and Express frontend on a single AWS EC2 instance using Terraform

PROJECT STRUCTURE

Terraform_Assignment/

- main.tf
- variables.tf
- outputs.tf
- terraform.tfvars
- README.md
- user-data/
  - setup.sh
- project/
  - backend/
  - frontend/

AWS CONFIGURATION

Region

ap-south-1

Instance Type

t3.micro

Operating System

Ubuntu 24.04

EC2 Instance

i-0f879b5aa75e50648

Public IP

13.201.81.152

APPLICATIONS

Flask Backend

http://13.201.81.152:5000

Express Frontend

http://13.201.81.152:3000

Flask API

http://13.201.81.152:5000/api

TERRAFORM COMMANDS

Initialize Terraform

terraform init

Format Terraform files

terraform fmt

Validate Terraform configuration

terraform validate

Create Terraform plan

terraform plan

Deploy infrastructure

terraform apply

View Terraform outputs

terraform output

AWS RESOURCES

Terraform creates the following resources

- AWS EC2 instance
- AWS Security Group
- SSH access on port 22
- Flask access on port 5000
- Express access on port 3000

EC2 CONFIGURATION

The EC2 instance is configured automatically using Terraform user-data

The setup script performs the following steps

1. Updates Ubuntu packages
2. Installs Python and required packages
3. Installs Node.js
4. Clones the project from GitHub
5. Creates a Python virtual environment
6. Installs Flask dependencies
7. Configures the MongoDB connection
8. Starts the Flask backend
9. Installs frontend dependencies
10. Starts the Express frontend

VERIFICATION

Flask API was tested from inside the EC2

curl http://127.0.0.1:5000/api

The API returned the project JSON data

Express was tested from inside the EC2

curl http://127.0.0.1:3000

The Express frontend returned the Submit Details page

Both applications were also tested using the EC2 public IP

GITHUB REPOSITORY



PART 1 RESULT

The Flask backend and Express frontend were successfully deployed on a single AWS EC2 instance using Terraform