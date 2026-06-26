resource "local_file" "ansible_inventory" {
  content = <<EOF
[web]
${aws_instance.web.public_ip}

[web:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=~/.ssh/database_test.pem
ansible_python_interpreter=/usr/bin/python3
EOF

  filename = "../ansible/inventory.ini"
}
