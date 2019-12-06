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

            sh 'make snap_with_junit_xml test=telemarketer'
          }
        }
        
       
    }
}
