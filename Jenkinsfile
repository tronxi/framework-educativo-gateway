pipeline {
    agent any
    environment {
        GATEWAY_TAG = '0.0.2'
    }
    stages {
        stage('Build') {
            steps {
                sh '''
                    docker build -t tronxi/framework-educativo-gateway:${GATEWAY_TAG} https://github.com/tronxi/framework-educativo-gateway.git#develop
                '''
            }
        }
        stage('Push') {
            steps {
                sh '''
                    docker push tronxi/framework-educativo-gateway:${GATEWAY_TAG}
                '''
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}