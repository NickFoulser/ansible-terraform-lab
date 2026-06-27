resource "local_file" "ansible_inventory" {
  content = <<EOF
[ubuntu]
${aws_instance.ubuntu_web.public_ip} ansible_user=ubuntu

[amazon]
${aws_instance.amazon_web.public_ip} ansible_user=ec2-user

[web:children]
ubuntu
amazon

[all:vars]
ansible_ssh_private_key_file=~/.ssh/database_test.pem
ansible_python_interpreter=/usr/bin/python3
EOF

  filename = "../ansible/inventory.ini"
}
