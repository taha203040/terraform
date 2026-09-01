output "instance_ip_addr" {
  value = aws_instance.my_instance.private_ip
}
output "instance_dns" {
  value = aws_instance.my_instance.public_dns
}