output "intance_private_ip" {
  description = "getting the private ip of instance"
  value = aws_instance.my_ec2_instance.private_ip
}


output "intance_public_ip" {
  description = "getting the public ip of instance"
  value = aws_instance.my_ec2_instance.public_ip
}