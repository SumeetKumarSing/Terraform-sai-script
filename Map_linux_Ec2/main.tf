provider "aws" {
  region = "eu-central-1"
}

variable "instance_tag" {
  description = "Adding multiple tags in instance"
  type        = map(string)
  default = {
    Name        = "Sumeet",
    Environment = "dev",
    Team        = "Devops"
  }

}
resource "aws_instance" "mysample" {
  ami                    = "ami-0de6934e87badb694"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  tags                   = var.instance_tag

}

resource "aws_security_group" "my_sg" {
  description = "allow ssh and http"
  name        = "my_sg"

  ingress {
    from_port   = 22
    to_port     = 22
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