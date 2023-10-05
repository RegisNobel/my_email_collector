pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'sudo docker build -t email-collector .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    sh 'sudo docker tag email-collector:latest regisnobel/email-collector:latest'
                    sh 'sudo docker push regisnobel/email-collector:latest'
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                script {
                    sh 'ssh ubuntu@54.88.240.233 "sudo docker pull regisnobele/email-collector:latest && sudo docker run -d -p 5001:5001 regisnobel/email-collector:latest"'
                }
            }
        }
    }
}
