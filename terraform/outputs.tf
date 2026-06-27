output "public_ip" {
  value = aws_instance.ubuntu_web.public_ip
}

output "public_dns" {
  value = aws_instance.ubuntu_web.public_dns
}
