pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh '''
                    docker build -t imaagen https://github.com/tronxi/framework-educativo-gateway.git#develop
                '''
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}