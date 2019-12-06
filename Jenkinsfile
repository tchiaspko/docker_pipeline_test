pipeline {
    agent {
        docker { image 'node:10-alpine' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
        stage('Build snap docker container') {
          steps {
            checkout scm
            sh 'pwd; ls -l'
            sh 'docker ps'
            echo 'Build the snap docker image'
            sh 'make build'
            echo 'Checking the snap docker image'
            sh 'docker images | grep -i snap'
          }
        }
        
       
    }
}
