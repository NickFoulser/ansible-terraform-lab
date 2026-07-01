output "public_ip" {
  value = aws_instance.ubuntu_web.public_ip
}

output "public_dns" {
  value = aws_instance.ubuntu_web.public_dns
}


output "amazon_ip" {

  value = aws_instance.amazon_web.public_ip

}

output "jenkins_ip" {

  value = aws_instance.jenkins.public_ip

}

output "jenkins_url" {

  value = "http://${aws_instance.jenkins.public_ip}:8080"

}
