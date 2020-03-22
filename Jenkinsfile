pipeline {
    agent any
    environment {
        //Use Pipeline Utility Steps plugin to read information from pom.xml into env variables
        pom = readMavenPom file: 'pom.xml'
        VERSION = pom.version
    }

    stages {
        stage('Build') {
            steps {
                echo "${VERSION}"
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