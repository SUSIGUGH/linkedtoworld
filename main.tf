terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Define the provider
provider "aws" {
  region = "ap-south-1"
}

# Define the security group
resource "aws_security_group" "master-sg" {
  name_prefix = "master_security_group"
  vpc_id = var.vpc_id

ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

