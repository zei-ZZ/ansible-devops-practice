pipeline {
    agent any

    stages {
        stage('Clone repo') {
            steps {
                git 'https://github.com/zei-ZZ/ansible-devops-practice.git'
            }
        }
        // stage('Generate SSH Keys') {
        //   steps {
        //     sh '''
        //       mkdir -p ~/.ssh
        //       ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
        //     '''
        //   }
        // }

        stage('Terraform Init') {
            steps {
                withCredentials([azureServicePrincipal(
                    credentialsId: 'azure-credentials',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                )]) {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([azureServicePrincipal(
                    credentialsId: 'azure-credentials',
                    subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                    clientIdVariable: 'ARM_CLIENT_ID',
                    clientSecretVariable: 'ARM_CLIENT_SECRET',
                    tenantIdVariable: 'ARM_TENANT_ID'
                )]) {
                    sh 'terraform apply -auto-approve -var "client_id=$ARM_CLIENT_ID" -var "client_secret=$ARM_CLIENT_SECRET" -var "subscription_id=$ARM_SUBSCRIPTION_ID" -var "tenant_id=$ARM_TENANT_ID"'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
