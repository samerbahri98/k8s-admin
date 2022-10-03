pipeline {
    agent {
        kubernetes{
            yamlFile 'ci/pod-template.yml'
        }
    }
    environment {
        KUBECONFIG=credentials('kubeconfig-admin')
    }
    parameters {
        string(name:'INVENTORY',defaultValue:'inventory.k8s.yml')
        string(name:'PLAYBOOK',defaultValue:'playbooks/misc/keepass_pull.yml')
    }
    stages{
        stage('checkout'){
            steps {
                container('ansible'){
                    sh '''
                    echo "begin"
                    ls -la
                    '''
                    checkout scm
                    ansiblePlaybook(
                        playbook: 'playbooks/misc/keepass_pull.yml',
                        inventory: 'inventory.k8s.yml', 
                        credentialsId: 'GitHub-SSH',
                        vaultCredentialsId: 'ansible-vault',
                        colorized: true,
                        extraVars: [
                            keepass_dbx: [value: '/ansible/.keepass/k8s.kdbx',hidden: true],
                            s3_keepass_endpoint: [value: 'https://s3.us-west-004.backblazeb2.com',hidden: true],
                            api_key: [value: credentials('vultr_api_key'),hidden: true],
                            s3_keepass_key_id: [value: credentials('s3_keepass_key_id'),hidden: true],
                            s3_keepass_key_name: [value: credentials('s3_keepass_key_name'),hidden: true],
                            s3_keepass_key_secret: [value: credentials('s3_keepass_key_secret'),hidden: true],
                            keepass_psw: [value: credentials('keepass_psw'),hidden: true]
                        ]
                    )
                    ansiblePlaybook(
                        playbook: '${params.PLAYBOOK}',
                        inventory: '${params.INVENTORY}',
                        credentialsId: 'GitHub-SSH',
                        vaultCredentialsId: 'ansible-vault'.
                        extraVars: [
                            keepass_dbx: [value: '/ansible/.keepass/k8s.kdbx',hidden: true],
                            s3_keepass_endpoint: [value: 'https://s3.us-west-004.backblazeb2.com',hidden: true],
                            api_key: [value: credentials('vultr_api_key'),hidden: true],
                            s3_keepass_key_id: [value: credentials('s3_keepass_key_id'),hidden: true],
                            s3_keepass_key_name: [value: credentials('s3_keepass_key_name'),hidden: true],
                            s3_keepass_key_secret: [value: credentials('s3_keepass_key_secret'),hidden: true],
                            keepass_psw: [value: credentials('keepass_psw'),hidden: true]
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