provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "mysample" {
    ami = var.ami
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    tags = {
        Name = "mysimple-instance"
    }
  
}

resource "aws_security_group" "my_sg" {
  description = "allow ssh and http"
   name = "my_sg"

   ingress { 
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.cidr]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [var.cidr]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.cidr]
   }
}