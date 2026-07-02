pipeline {
    agent any

    parameters {
        choice(
            name: 'TARGET',
            choices: [
                'all',
                'web',
                'ubuntu',
                'amazon',
                'tst-web01',
                'prd-web01'
            ],
            description: 'Select hosts to patch'
        )

        booleanParam(
            name: 'CHECK_MODE',
            defaultValue: true,
            description: 'Run in Ansible check mode (dry run)'
        )
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'git@github.com:NickFoulser/ansible-terraform-lab.git'
            }
        }

        stage('Patch') {
            steps {
                sshagent(credentials: ['ec2-ssh-key']) {
                    script {
                        def cmd = "ansible-playbook patch_server.yml"

                        if (params.TARGET != 'all') {
                            cmd += " --limit ${params.TARGET}"
                        }

                        if (params.CHECK_MODE) {
                            cmd += " --check"
                        }

                        echo "Running: ${cmd}"

                        sh """
                            cd ansible
                            ${cmd}
                        """
                    }
                }
            }
        }
    }
}
