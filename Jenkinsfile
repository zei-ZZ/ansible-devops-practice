pipeline {
    agent any

    stages {
        stage('Clone repo') {
            steps {
                git 'https://github.com/zei-ZZ/ansible-devops-practice.git'
            }
        }
        stage('Check docker containers before deployment') {
            steps {
                sh 'docker ps'
            }
        }
        stage('Terraform') {
            steps {
                sh 'terraform init'
                sh 'terraform apply -auto-approve'
            }
        }
        stage('Check correct deployment')
        {
            steps {
                sh 'docker ps -f name=nginx-test'
            }
        }

        stage('Clean')
        {
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}
