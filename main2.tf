provider "aws" {
  region = "us-west-2" # Replace with your desired AWS region
}

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "main-subnet"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id

  tags = {
    Name = "web-server"
  }
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the created VPC."
}

output "subnet_id" {
  value       = aws_subnet.main.id
  description = "The ID of the created Subnet."
}

output "web_instance_public_ip" {
  value       = aws_instance.web.public_ip
  description = "The public IP of the web server instance."
}
