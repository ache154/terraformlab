terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.42"
    }
  }
  required_version = ">0.15.3"
}

provider "aws" {
  profile = "skillmix-lab"
  region = "us-west-2"
}

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
  
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] #canonical
}

resource "aws_instance" "web" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.private.id

}
