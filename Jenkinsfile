pipeline {
    agent {
        docker { image 'node:12.13.1' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}
