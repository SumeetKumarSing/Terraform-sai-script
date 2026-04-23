provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "linux_ec2" {
  ami           = "ami-0de6934e87badb694" # Example Amazon Linux 2 AMI (update if needed)
  instance_type = "t3.micro"
  key_name      = "test1"

  tags = {
    Name = "Linux-innstance"
  }
}