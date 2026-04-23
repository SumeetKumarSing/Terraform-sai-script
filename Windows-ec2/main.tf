provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "Windows-instance" {
  ami                    = "ami-0df8c351481e18ec8"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  key_name = "19march"
  tags = {
    Name = "Windows-instance"
  }
}

resource "aws_security_group" "my_sg" {
  description = "Allowing rds and http"
  name        = "my_sg"
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_public_ip" {
  description = "Getting the Public IP of Instance"
  value       = aws_instance.Windows-instance.public_ip
}

output "instance_private_ip" {
  description = "Getting the Private IP of Instance"
  value       = aws_instance.Windows-instance.private_ip
}