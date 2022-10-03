pipeline {
    agent {
        kubernetes{
            yamlFile 'ci/pod-template.yml'
        }
    }
    environment {
        KUBECONFIG=credentials('kubeconfig-admin')
        keepass_dbx='/ansible/.keepass/k8s.kdbx'
        api_key=credentials('vultr_api_key')
        keepass_psw=credentials('keepass_psw')
        s3_keepass_key_id=credentials('s3_keepass_key_id')
        s3_keepass_key_name=credentials('s3_keepass_key_name')
        s3_keepass_key_secret=credentials('s3_keepass_key_secret')
        s3_keepass_endpoint='https://s3.us-west-004.backblazeb2.com'
    }
    parameters {
        string(name:'INVENTORY',defaultValue:'inventory.k8s.yml')
        string(name:'PLAYBOOK',defaultValue:'playbooks/misc/keepass_pull.yml')
    }
    stages{
        stage('checkout'){
            steps {
                container('ansible'){
                    checkout scm
                    ansiblePlaybook(
                        playbook: 'playbooks/misc/keepass_pull.yml',
                        inventory: 'inventory.k8s.yml', 
                        credentialsId: 'GitHub-SSH',
                        vaultCredentialsId: 'ansible-vault'
                    )
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
}