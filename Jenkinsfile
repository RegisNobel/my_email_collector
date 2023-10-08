pipeline {
    agent any 

    stages {
        stage('Checkout Code') {
            steps {
                // This will automatically pull the latest version of your code from GitHub
                checkout scm 
            }
        }

        stage('Clean Up Old Stuff') {
            steps {
                // This will remove all stopped containers and all dangling images
                sh 'docker image prune -f'
                sh 'docker container prune -f'
                sh 'docker rm -f email_collector || true'
                //sh 'docker rm -f $(docker ps -aq)'

            }
        }

        stage('Build Docker Image') {
            steps {
                // Build a Docker image tagged as 'latest'
                sh 'docker build -t email_collector:latest .'
            }
        }

        stage('Run Docker Container') {
            steps {
                // This will run a new container from the image built in the previous stage
                // Also, specify the name of the container as 'email_collector'
                sh 'docker run -d -p 5002:5002 --name email_collector email_collector:latest'
            }
        }
    }
}
