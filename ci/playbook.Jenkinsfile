pipeline {
    agent {
        kubernetes{
            yamlFile 'ci/pod-template.yml'
        }
    }
    environment {
        KUBECONFIG=credentials('kubeconfig-admin')
        HOST_VAR=credentials('localhost.yml')
        keepass_dbx="/home/jenkins/agent/workspace/Ansible/Playbook/.keepass/k8s.kdbx"
    }
    parameters {
        string(name:'INVENTORY',defaultValue:'inventory/')
        string(name:'PLAYBOOK',defaultValue:'playbooks/misc/keepass_pull.yml')
    }
    stages{
        stage('checkout'){
            steps {
                container('ansible'){
                    checkout scm
                    sh '''
                    ln -s $HOST_VAR inventory/host_vars/localhost.yml
                    '''
                    ansiblePlaybook(
                        playbook: 'playbooks/misc/keepass_pull.yml',
                        inventory: 'inventory/',
                        credentialsId: 'GITHUB-SSH',
                        vaultCredentialsId: 'ansible-vault',
                        colorized: true,
                        extraVars: [
                            keepass_dbx: keepass_dbx
                        ]
                    )
                    ansiblePlaybook(
                        playbook: "${params.PLAYBOOK}",
                        inventory: "${params.INVENTORY}",
                        credentialsId: 'GITHUB-SSH',
                        vaultCredentialsId: 'ansible-vault',
                        colorized: true,
                        extraVars: [
                            keepass_dbx: keepass_dbx
                        ]
                    )
                    sh '''
                    echo "end"
                    '''
                }
            }
        }
    }
}