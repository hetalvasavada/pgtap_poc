pipeline {
  agent any
  environment {
    POSTGRES_HOST = 'localhost'
    POSTGRES_USER = 'postgres'
  }

  stages {
    stage('run!') {
      steps {
        script {
		 sh 'docker build -t pgtapjenkins:${BUILD_NUMBER} -f Dockerfile .'
            docker.image('pgtapjenkins:${BUILD_NUMBER}').withRun("-h localhost -e POSTGRES_USER=postgres -v ${env.WORKSPACE}:/tmp/tests"){ db ->
                docker.image('pgtapjenkins:${BUILD_NUMBER}').inside("--link ${db.id}:db") {
                   sh '''
                     psql --version
                     until psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -c "select 1" > /dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
                     echo "Waiting for postgres server, $((RETRIES-=1)) remaining attempts..."
                     sleep 1
                     done
                   '''
                   sh 'echo "Running DB Prerequisites to create pgtap extension"'
                   sh '/db_prereqs.sh ${POSTGRES_HOST} ${POSTGRES_USER}'
                  // sh "psql ${POSTGRES_HOST} -U ${POSTGRES_USER} -f testcases/sample_schema1/tables/table1_test.t -e"
                  }
              }
            }
      }
    }
  }
}