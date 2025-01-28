# Specify the Terraform provider (AWS in this case)
provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

# Create an AWS EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with an appropriate AMI ID
  instance_type = "t2.micro"              # Smallest instance type (eligible for free tier)

  # Tag for the instance
  tags = {
    Name = "BasicTerraformInstance"
  }
}


# one more comment
