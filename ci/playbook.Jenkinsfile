pipeline {
    agent {
        kubernetes{
            yamlFile 'ci/pod-template.yml'
        }
    }
    environment {
        KUBECONFIG=credentials('kubeconfig-admin')
        HOST_VAR=credentials('localhost.yml')
        WORKSPACE="/ansible"
    }
    parameters {
        string(name:'INVENTORY',defaultValue:'inventory/')
        string(name:'PLAYBOOK',defaultValue:'playbooks/misc/keepass_pull.yml')
    }
    stages{
        stage('checkout'){
            steps {
                container('ansible'){
                    sh '''
                    ln -s $HOST_VAR inventory/host_vars/localhost.yml
                    pwd
                    '''
                    checkout scm
                    ansiblePlaybook(
                        playbook: 'playbooks/misc/keepass_pull.yml',
                        inventory: 'inventory/',
                        credentialsId: 'GitHub-SSH',
                        vaultCredentialsId: 'ansible-vault',
                        colorized: true,
                    )
                    ansiblePlaybook(
                        playbook: "${params.PLAYBOOK}",
                        inventory: "${params.INVENTORY}",
                        credentialsId: 'GitHub-SSH',
                        vaultCredentialsId: 'ansible-vault',
                        colorized: true,
                    )
                    sh '''
                    echo "end"
                    '''
                }
            }
        }
    }
}