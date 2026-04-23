provider "aws" {
  region = "eu-central-1"
}

variable "instance" {
  description = "Creating multiple instance with diff  intnac tyoe using loop"
  type        = map(string)
  default = {
    "InstanceA" = "t2.micro",
    "InstanceB" = "t2.small",
  }
}
resource "aws_instance" "mysample" {
  for_each               = var.instance
  ami                    = "ami-0de6934e87badb694"
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  tags = {
    Name = each.key
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