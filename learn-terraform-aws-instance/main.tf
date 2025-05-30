terraform {
  cloud {
    organization = "wonhee-org"
    workspaces {
      name = "learn-terraform-aws"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0f605570d05d73472"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
