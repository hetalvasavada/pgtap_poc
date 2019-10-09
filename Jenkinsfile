pipeline {
  agent any
  environment {
    POSTGRES_HOST = 'localhost'
    POSTGRES_USER = 'myuser'
  }

  stages {
    stage('run!') {
      steps {
        script {
		 sh 'docker build -t pgtapjenkins:${BUILD_NUMBER} -f Dockerfile .'
            docker.image('pgtapjenkins:${BUILD_NUMBER}').withRun(
               "-h localhost -e POSTGRES_USER=postgres -v ${env.WORKSPACE}/tests:/tmp/tests"){ db ->
// You can your image here but you need psql to be installed inside
                docker.image('pgtapjenkins:${BUILD_NUMBER}').inside("--link ${db.id}:db") {
                  sh '''
psql --version
until psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -c "select 1" > /dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
  echo "Waiting for postgres server, $((RETRIES-=1)) remaining attempts..."
  sleep 1
done
'''
                  sh 'echo "your commands here"'
                }
              }
            }
      }
    }
  }
}