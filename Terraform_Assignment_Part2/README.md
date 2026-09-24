TERRAFORM DEVOPS ASSIGNMENT - PART 2

OBJECTIVE

Deploy the Flask backend and Express frontend on two separate AWS EC2 instances using Terraform

PROJECT STRUCTURE

Terraform_Assignment_Part2/

- main.tf
- variables.tf
- outputs.tf
- terraform.tfvars
- README.md
- user-data/
  - backend.sh
  - frontend.sh

AWS CONFIGURATION

Region

ap-south-1

Instance Type

t3.micro

Operating System

Ubuntu 24.04

VPC

10.0.0.0/16

Public Subnet

10.0.1.0/24

FLASK EC2

Instance ID

i-0c457d4e054e5017d

Private IP

10.0.1.150

Public IP

43.205.233.106

Flask URL

http://43.205.233.106:5000

Flask API

http://43.205.233.106:5000/api

EXPRESS EC2

Instance ID

i-05a1427b769986bc1

Private IP

10.0.1.221

Public IP

65.0.80.124

Express URL

http://65.0.80.124:3000

NETWORKING

Terraform creates the following networking resources

- AWS VPC
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association
- Flask Security Group
- Express Security Group

SECURITY GROUP CONFIGURATION

Flask Security Group

- SSH port 22
- Flask port 5000
- Port 5000 communication from Express security group

Express Security Group

- SSH port 22
- Express port 3000

EC2 CONFIGURATION

The Flask EC2 is configured automatically using backend.sh

The setup script performs the following steps

1. Updates Ubuntu packages
2. Installs Python and required packages
3. Clones the project from GitHub
4. Configures the MongoDB connection
5. Creates a Python virtual environment
6. Installs Flask dependencies
7. Starts the Flask backend on port 5000

The Express EC2 is configured automatically using frontend.sh

The setup script performs the following steps

1. Updates Ubuntu packages
2. Installs Node.js
3. Clones the project from GitHub
4. Installs frontend dependencies
5. Configures the Flask backend private IP
6. Starts the Express frontend on port 3000

APPLICATION COMMUNICATION

The Express EC2 communicates with the Flask EC2 using the Flask private IP

Backend address used by Express

http://10.0.1.150:5000

The communication was tested from the Express EC2 using

curl http://10.0.1.150:5000/api

The Flask API returned the expected project JSON data

VERIFICATION

Flask was tested from inside the Flask EC2

curl http://127.0.0.1:5000/api

The API returned the project JSON data

Express was tested from inside the Express EC2

curl http://127.0.0.1:3000

The Express frontend returned the Submit Details page

Communication between both EC2 instances was tested using the Flask private IP

curl http://10.0.1.150:5000/api

The request was successful

Both applications were also tested using their public IP addresses

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

GITHUB REPOSITORY



PART 2 RESULT

The Flask backend and Express frontend were successfully deployed on two separate AWS EC2 instances using Terraform

Both applications are running on their respective ports and the Express EC2 can communicate with the Flask EC2 through the VPC private network