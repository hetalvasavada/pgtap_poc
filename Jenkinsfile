pipeline {
    agent any 
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t pgTAP_POC:${BUILD_NUMBER} -f Dockerfile .'
      }
    }
    }
}