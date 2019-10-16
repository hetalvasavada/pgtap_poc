pipeline {
  agent any
  environment {
      POSTGRES_HOST = "localhost"
      POSTGRES_USER = "postgres" 
      pgreport = "pgtapreport"
      testdir = "pgtaptests"      
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
                   
                   //This is Unit Tests Suite:       
                 // Get list of changed files list and check if it contains pgtaptests in it:
                        List<String> sourceChanged = sh(returnStdout: true, script: "git whatchanged -n 1").split()
                        def isSourceChanged = false
                        def isChangelogUpdated = false
                        for (int i = 0; i < sourceChanged.size(); i++) {
                            if (sourceChanged[i].contains("testcases")) {
                                                                // Found some new/edited tests files to be run under testcases folder, so run each one:
                                                                    isSourceChanged=true                                                              
                                                                    println sourceChanged[i]
                                                                    println isSourceChanged
                                                                    sh "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -f ${sourceChanged[i]} -e >> ${env.WORKSPACE}/${env.pgreport}_${BUILD_NUMBER}_${i}.tap"
                                                                    sh "cat ${env.WORKSPACE}/${env.pgreport}_${BUILD_NUMBER}_${i}.tap"
                            }                            
                        }                     
                            if (!isSourceChanged) {
                            println "pgTapTests not changed in this git commit so not running any tests. No report will be generated or sent anywhere."
                                            return
                        }
                   
                  // sh "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -f testcases/sample_schema1/functions/function1_test.t -e >> ${env.WORKSPACE}/${env.pgreport}${BUILD_NUMBER}.tap"
                  }
              }
     
            }
      step([$class: "TapPublisher", testResults: "**/${env.pgreport}_${BUILD_NUMBER}*.tap"])
      }
    }
	
	stage("first"){
            steps {
                timestamps {
                      logstash{ 
                       echo "hello world 1"
                      }
                  
                }
            }
        }
	
	
	
  }
}