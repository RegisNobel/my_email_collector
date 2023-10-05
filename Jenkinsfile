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
                    sh 'docker build -t email-collector .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    sh 'docker tag email-collector:latest regisnobel/email-collector:latest'
                    sh 'docker push regisnobel/email-collector:latest'
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                script {
                    sh 'ssh ubuntu@54.88.240.233 "docker pull regisnobele/email-collector:latest && docker run -d -p 5001:5001 regisnobel/email-collector:latest"'
                }
            }
        }
    }
}
