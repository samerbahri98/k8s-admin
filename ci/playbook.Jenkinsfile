pipeline {
    agent {label 'jenkins-ansible'}
    parameters {
        string(name:'INVENTORY',defaultValue:'inventory.k8s.yml')
        string(name:'PLAYBOOK',defaultValue:'playbooks/misc/keepass_pull.yml')
    }
    stages{
        stage('checkout'){
            steps {
                checkout scm
                ansiblePlaybook(
                    playbook: 'playbooks/misc/keepass_pull.yml',
                    inventory: 'inventory.k8s.yml', 
                    credentialsId: 'GitHub-SSH',
                    vaultCredentialsId: 'ansible-vault'
                )
            }
        }
        stage('playbook'){
            steps{
                ansiblePlaybook(
                    playbook: '${params.PLAYBOOK}',
                    inventory: '${params.INVENTORY}',
                    credentialsId: 'GitHub-SSH',
                    vaultCredentialsId: 'ansible-vault'
                )
            }
        }
    }
}