pipeline {
    agent any 
    stages{
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t pgtap:${BUILD_NUMBER} -f Dockerfile .'
         docker.image('pgtapjenkins:B${BUILD_NUMBER}').withRun(
              "-h localhost -e POSTGRES_USER=postgres -v ${env.WORKSPACE}/tests:/tmp/tests") { db ->
                docker.image('pgtapjenkins:B${BUILD_NUMBER}').inside("--link ${db.id}:db") {                  
                  try {
                  //Wait for postgres db client to be up
                  sh '''
                       psql --version
                       until psql -h localhost -U postgres -c "select 1" > /dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
                       echo "Waiting for postgres server, $((RETRIES-=1)) remaining attempts..."
                       sleep 1
                       done
                  '''  
                  
                  }
               }
            }
        
      }
    }
    }
    
}