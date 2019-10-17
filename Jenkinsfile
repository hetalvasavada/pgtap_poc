import hudson.model.*

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
 
      }
    }
	
	 stage('Publish Test Results') { 
	        //This step will publish the result in Jenkins Build link under 'Extended TAP Tests Results'
	        steps {
	            timestamps {
	              logstash{       
	                     step([$class: "TapPublisher", testResults: "**/${env.pgreport}_${BUILD_NUMBER}*.tap"]) 
	                //Next step is to gather datato send to ELK
	                script {
	                  try {
						println "Parse and get results data from TAP PLugin APIs"
						def sample = parseTAPTests()
						//Collect User (who did last git commit) details and time of job run 
						def user = sh(returnStdout: true, script: "git log -1 --pretty=format:'%an'").split()                     
						writeFile file: "report.txt", text: "RESULT_SET:${sample},${user}"
						sh "cat report.txt" 
	                  } catch (Exception e) {
	                      e.printStackTrace()
	                      currentBuild.result = 'FAILURE'
	                  }  
	                }
	                script {
	                  def now = new Date()
                      sh """
                         cat > message.json <<EOF
                        {
                        "enviroment": "$ENV",
                        "build_number": "$BUILD_NUMBER",
                        "build_tag": "$BUILD_TAG",
                        "job_base_name": "$JOB_BASE_NAME",
                        "job_name": "$JOB_NAME",
                        "node_name": "$NODE_NAME",
                        "node_labels": "$NODE_LABELS",
                        "status": currentBuild.currentResult,
                        "date": now.format("yy/MM/dd.HH-mm", TimeZone.getTimeZone('UTC')) 
                        }
                        EOF

                        curl -XPUT '${env.JENKINS_HOST}:9200/logstashtest/jenkins/1?pretty' -d '@message.json'
                        """
	                }
	              }
	            }   
	        }      
	    }
	
	
    }
}

@NonCPS
	def parseTAPTests() {  
	println "Start of parseTAPTests function"
	def thr = Thread.currentThread()
	        def currentJob = manager.build
	def putToFile = ""
	println "for (def action : currentJob.actions)"
	for (def action : currentJob.actions) {   
	          if (action.getClass() == org.tap4j.plugin.TapTestResultAction) {
	            println 'Gathered Test Results'
	   println "def noOfFailedTests = action.getFailCount()"
	   def noOfFailedTests = action.getFailCount() 
	       def noOfTotalTests = action.getTotalCount() 
	       def noOfSkippedTests = action.getSkipCount()
	   def noOfPassedTests = noOfTotalTests - noOfFailedTests - noOfSkippedTests
	   def result = "Pass"
	    println "if (noOfFailedTests > 0) {"
	   if (noOfFailedTests > 0) {
	    result = "Fail"
	   }       
	   println "def now = new Date()"
	   def now = new Date()
	            println now.format("yy/MM/dd.HH-mm", TimeZone.getTimeZone('UTC')) 
	   def timee = now.format("yy/MM/dd.HH-mm", TimeZone.getTimeZone('UTC'))
	 println "TOTAL_NO_TESTS: ${noOfTotalTests}"
	 println "TOTAL_PASS_TESTS: ${noOfPassedTests}"
	 println "TOTAL_FAIL_TESTS: ${noOfFailedTests}"
	  println "TOTAL_RESULTS: ${result}"
	  println "TOTAL_TIME: ${timee}"
	 putToFile = "${noOfTotalTests},${noOfPassedTests},${noOfFailedTests},${result},${timee}"
	//def putToFile = "Sample Text"     
	   
	         }
	       }
	       println "End of parseTAPTests function"
	    return putToFile.toString()
	 }