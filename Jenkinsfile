pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'webnerd00/flask-app:latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Saujanya00/Python_DevOps-SimpleProject.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        stage('Test Application') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).inside {
                         sh 'pytest test_app.py -v'
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'be636de8-9fe8-4060-b493-966fc7a61f51') {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Here you can add the commands to deploy the Docker container or use Kubernetes to deploy
                    echo 'Deploying the Flask app...'
                }
            }
        }
    }
}
