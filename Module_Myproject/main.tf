provider "aws" {
  region = "eu-central-1"
}

module "my_linux_instance" {
  source = "./Ec2-module"
  instance_type = "t2.medium"
}

output "My_public_ip" {
  description = "Public ip of running instance"
  value       = module.my_linux_instance.intance_public_ip
}