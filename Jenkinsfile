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
		// sh 'docker build -t pgtapjenkins:${BUILD_NUMBER} -f Dockerfile .'
		   docker.image('pgtapjenkins:2').withRun("-h localhost -e POSTGRES_USER=postgres -v ${env.WORKSPACE}:/tmp/tests"){ db ->
         //   docker.image('pgtapjenkins:${BUILD_NUMBER}').withRun("-h localhost -e POSTGRES_USER=postgres -v ${env.WORKSPACE}:/tmp/tests"){ db ->
                docker.image('pgtapjenkins:2').inside("--link ${db.id}:db") {
                //docker.image('pgtapjenkins:${BUILD_NUMBER}').inside("--link ${db.id}:db") {
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
                                // println sourceChanged[i]
                                //println isSourceChanged
                                sh "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -f ${sourceChanged[i]} -e >> ${env.WORKSPACE}/${env.pgreport}_${BUILD_NUMBER}_${i}.tap"
                                //sh "cat ${env.WORKSPACE}/${env.pgreport}_${BUILD_NUMBER}_${i}.tap"
                            }
                            
                            if (sourceChanged[i].contains("src")) {
                                // Found some new/edited tests files to be run under testcases folder, so run each one:
                                isSourceChanged=true                                                              
                                println sourceChanged[i]
                                println ${env.WORKSPACE}
                                println isSourceChanged
                                sh "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -f ${sourceChanged[i]} -e >> ${env.WORKSPACE}/${env.pgreport}_${BUILD_NUMBER}_${i}.tap"
                                //sh "cat ${env.WORKSPACE}/${env.pgreport}_${BUILD_NUMBER}_${i}.tap"
                            }
                        }                     
                            if (!isSourceChanged) {
                                println "Source and Tests are not changed in this git commit so not running any tests. No rport will be generated or sent anywhere."
                                sh "exit 0" 
                        }
                   
                   sh "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -f testcases/sample_schema1/functions/function1_test.t -e >> ${env.WORKSPACE}/${env.pgreport}${BUILD_NUMBER}.tap"
                  }
              }
     
            }
 
        }
    }
	
	 stage('Publish Test Results') { 
	        //This step will publish the result in Jenkins Build link under 'Extended TAP Tests Results'
	        steps {
	            //timestamps {
	              //logstash{       
	                     step([$class: "TapPublisher", testResults: "**/${env.pgreport}_${BUILD_NUMBER}*.tap"]) 
	                //Next step is to gather datato send to ELK
	                script {
	                  try {
						println "Parse and get results data from TAP PLugin APIs"						
						def now = new Date()
	                    def timee = now.format("yy/MM/dd:HH-mm", TimeZone.getTimeZone('UTC'))
						def user = sh(returnStdout: true, script: "git log -1 --pretty=format:'%an'").split()   
						def part1 = "{\"Build_Number\": \"${BUILD_NUMBER}\", \"Job_Name\": \"${JOB_BASE_NAME}\", \"Triggered_By\": \" ${user}\",	\"Triggered_Date\": \"${timee}\", "
						def sample = ""
 						timestamps {
	              			logstash{       	           
						          sample = parseTAPTests()
					        }
					    }
						def part2 = "${sample} }"
						def jsoncontent = "${part1} ${part2}"
						//Collect User (who did last git commit) details and time of job run 
						writeFile file: "message.json", text: "${jsoncontent}"
					    sh "cat message.json"					  
	                    def cmd = "curl  -XPOST 'http://${env.JENKINS_HOST}:9200/jenkinstest/jenkins' -H \"Content-Type: application/json\" -d \"@message.json\""
	                    def response = sh(returnStdout: true, script: "curl  -XPOST 'http://${env.JENKINS_HOST}:9200/jenkinstest/jenkins' -H \"Content-Type: application/json\" -d \"@message.json\"")
                        sh "echo $response" 
	                  } catch (Exception e) {
	                      e.printStackTrace()
	                      currentBuild.result = 'FAILURE'
	                  }  
	                }
	               
	             // }
	           // }   
	        }      
	    }
	
	
    }

}

@NonCPS
	def parseTAPTests() {  
	println "Start of parseTAPTests function"
	  def noOfFailedTests = 0 
	  def noOfTotalTests = 0
	  def noOfSkippedTests = 0
	  def noOfPassedTests = 0
	  def result = "SUCCESS"
                
	def thr = Thread.currentThread()
	        def currentJob = manager.build
	        def putToFile = "Sample"
	        for (def action : currentJob.actions) {   
	           if (action.getClass() == org.tap4j.plugin.TapTestResultAction) {
	              println 'Gathering Test Results....'
	              noOfFailedTests = action.getFailCount() 
				  noOfTotalTests = action.getTotalCount()
				  noOfSkippedTests = action.getSkipCount()
	   			  noOfPassedTests = noOfTotalTests - noOfFailedTests - noOfSkippedTests
	   			  if (noOfFailedTests > 0) {
	    				result = "FAILURE"
	   			  }       
	 		 }
	       }
	       println "TOTAL_NO_TESTS: ${noOfTotalTests} , TOTAL_PASS_TESTS: ${noOfPassedTests}, TOTAL_FAIL_TESTS: ${noOfFailedTests}, TOTAL_RESULTS: ${result}"
	 	   putToFile = "\"Job_Status\": \"${result}\", \"TESTS_TOTAL\": \"${noOfTotalTests}\", \"TESTS_PASS\": \"${noOfPassedTests}\",\"TESTS_FAIL\": \"${noOfFailedTests}\", \"TESTS_SKIPPED\": \"${noOfSkippedTests}\" "
	       println "Done....End of parseTAPTests function"
	    return putToFile.toString()
	 }