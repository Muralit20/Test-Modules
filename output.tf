output "My_instance_public_ip" {
  value = aws_instance.ec2_instance[0].public_ip
}