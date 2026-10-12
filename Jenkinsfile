pipeline {
    agent any

    environment {
        IMAGE_NAME = 'java-web-image'
        CONTAINER_NAME = 'java-web-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Maven Build and Test') {
            steps {
                // Use the Maven wrapper provided in the downloaded zip
                sh './mvnw clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Deploy Docker Container') {
            steps {
                // Stop any existing container, then run the new one on port 8080
                sh """
                    docker rm -f ${CONTAINER_NAME} || true
                    docker run -d -p 8080:8080 --name ${CONTAINER_NAME} ${IMAGE_NAME}
                """
            }
        }
    }
}