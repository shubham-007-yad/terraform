    terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 6.0"
        }
    }

    required_version = ">= 1.6.0"
    }

    provider "aws" {
    region = var.aws_region
    }

    resource "aws_security_group" "app_sg" {
    name        = "terraform-part1-app-sg"
    description = "Allow SSH, Flask and Express"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 5000
        to_port     = 5000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 3000
        to_port     = 3000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "terraform-part1-app-sg"
    }
    }

    resource "aws_instance" "app" {
    ami           = var.ami_id
    instance_type = var.instance_type
    key_name      = "course-rebelshub"

    vpc_security_group_ids = [aws_security_group.app_sg.id]

    user_data = templatefile("${path.module}/user-data/setup.sh", {
        mongo_uri = var.mongo_uri
    })

    user_data_replace_on_change = true

    tags = {
        Name = "terraform-test"
    }
    }