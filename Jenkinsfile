pipeline {
    agent any
    environment {
        GATEWAY_TAG = '0.0.3'
        DOCKER_HUB_PASSWORD = credentials('DOCKER_HUB_PASS')
    }
    stages {
        stage('Deploy') {
            steps {
                sh '''
                    export PATH=/root/google-cloud-sdk/bin:$PATH
                '''
            }
        }
        stage('Build') {
            steps {
                sh '''
                    echo $DOCKER_HUB_PASSWORD
                    docker build -t tronxi/framework-educativo-gateway:${GATEWAY_TAG} https://github.com/tronxi/framework-educativo-gateway.git#develop
                '''
            }
        }
        stage('Push') {
            steps {
                sh '''
                    docker login  --username tronxi --password-stdin $DOCKER_HUB_PASSWORD
                    docker push tronxi/framework-educativo-gateway:${GATEWAY_TAG}
                '''
            }
        }

    }
}