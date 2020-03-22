pipeline {
    agent any
    environment {
        GATEWAY_TAG = '0.0.2'
        DOCKER_HUB_PASSWORD = ${DOCKER_HUB_PASS}
    }
    stages {
        stage('Build') {
            steps {
                sh '''
                    echo ${DOCKER_HUB_PASSWORD}
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