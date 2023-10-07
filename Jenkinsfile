pipeline {
    agent any 

    stages {
        stage('Checkout Code') {
            steps {
                // This will automatically pull the latest version of your code from GitHub
                checkout scm 
            }
        }

        stage('Clean Up Old Images') {
            steps {
                // This will remove all stopped containers and all dangling images
                sh 'docker image prune -f'
                sh 'docker container prune -f'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build a Docker image tagged as 'latest'
                sh 'docker build -t email-collector:latest .'
            }
        }

        stage('Run Docker Container') {
            steps {
                // This will run a new container from the image built in the previous stage
                sh 'docker run -d -p 5001:5001 email-collector:latest'
            }
        }
    }
}
