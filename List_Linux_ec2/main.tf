provider "aws" {
  region = "eu-central-1"
}

variable "instance_type" {
  description = "Adding multiple instance_type"
  default     = ["t2.micro", "t2.small", "t2.medium"]
  type        = list(string)
}
resource "aws_instance" "mysample" {
  ami                    = "ami-0de6934e87badb694"
  instance_type          = var.instance_type[1]
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  tags = {
    Name = "mysimple-instance"
  }

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