provider "aws" {
  region = "us-east-1" # Replace with your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI ID for your region
  instance_type = "t2.micro" # Choose an appropriate instance type

  # Tags to identify your instance
  tags = {
    Name = "example-instance"
  }

  # Optional: Associate a key pair for SSH access
  key_name = "my-key-pair" # Replace with your key pair name

  # Optional: Security group setup (default allows SSH access)
  vpc_security_group_ids = [aws_security_group.example.id]
}

resource "aws_security_group" "example" {
  name_prefix = "example-sg-"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Be cautious with this in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example-security-group"
    Description = "Enable SSH access to example host"
  }
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
  description = "The public IP of the EC2 instance."
}
