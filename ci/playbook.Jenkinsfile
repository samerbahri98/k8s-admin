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
        keepass_dbx="/ansible/workspace/Ansible/Playbook/.keepass"
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
                        credentialsId: 'GitHub-SSH',
                        vaultCredentialsId: 'ansible-vault',
                        colorized: true,
                        extraVars: [[key:'keepass_dbx',value:env.keepass_dbx]]
                    )
                    ansiblePlaybook(
                        playbook: "${params.PLAYBOOK}",
                        inventory: "${params.INVENTORY}",
                        credentialsId: 'GitHub-SSH',
                        vaultCredentialsId: 'ansible-vault',
                        colorized: true,
                        extraVars: [[key:'keepass_dbx',value:env.keepass_dbx]]
                    )
                    sh '''
                    echo "end"
                    '''
                }
            }
        }
    }
}