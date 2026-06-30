resource "local_file" "ansible_inventory" {
  content = <<EOF
[ubuntu]
${aws_instance.ubuntu_web.public_ip} ansible_user=ubuntu server_environment=${aws_instance.ubuntu_web.tags["Environment"]} server_hostname=${aws_instance.ubuntu_web.tags["Name"]}

[amazon]
${aws_instance.amazon_web.public_ip} ansible_user=ec2-user server_environment=${aws_instance.amazon_web.tags["Environment"]} server_hostname=${aws_instance.amazon_web.tags["Name"]}

[web:children]
ubuntu
amazon

[all:vars]
ansible_ssh_private_key_file=~/.ssh/database_test.pem
ansible_python_interpreter=/usr/bin/python3
EOF

  filename = "../ansible/inventory.ini"
}
