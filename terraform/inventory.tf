resource "local_file" "ansible_inventory" {

content = <<EOF
[ubuntu]
${aws_instance.ubuntu_web.tags["Name"]} ansible_host=${aws_instance.ubuntu_web.public_ip} ansible_user=ubuntu server_environment=${aws_instance.ubuntu_web.tags["Environment"]}

[amazon]
${aws_instance.amazon_web.tags["Name"]} ansible_host=${aws_instance.amazon_web.public_ip} ansible_user=ec2-user server_environment=${aws_instance.amazon_web.tags["Environment"]}

[jenkins]
${aws_instance.jenkins.tags["Name"]} ansible_host=${aws_instance.jenkins.public_ip} ansible_user=ec2-user server_environment=${aws_instance.jenkins.tags["Environment"]}

[web:children]
ubuntu
amazon

[all:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_ssh_private_key_file=~/.ssh/database_test.pem
EOF

  filename = "../ansible/inventory.ini"
}
