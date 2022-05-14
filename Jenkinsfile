pipeline {
        agent { dockerfile true }


    stages {
        stage('node version') {
            steps {
                sh 'node --version'
            }
        }
        stage('Test') {
          steps {

            sh 'echo "hello, world"'
          }
        }
        
       
    }
}
