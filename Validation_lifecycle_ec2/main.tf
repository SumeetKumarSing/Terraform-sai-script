provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "my_sg" {
  description = "My Test Security Group"
  name        = "my-security-group"
}

resource "aws_instance" "my_linux" {
  ami           = "ami-0de6934e87badb694" # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"
  lifecycle {
    precondition { # This will check if the security group is not blank before creating the instance
      condition     = aws_security_group.my_sg.id != ""
      error_message = "Security group should not be blank"
    }
    postcondition { # This will check if the instance has a public IP after creation
      condition     = self.public_ip != ""
      error_message = "Did't get any  public ip"
    }

  }

  tags = {
    Name = "My Linux Instance"
  }
}
