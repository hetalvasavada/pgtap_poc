import hudson.model.*

pipeline {
  agent any
  environment {
      POSTGRES_HOST = "localhost"
      POSTGRES_USER = "postgres" 
      pgreport = "pgtapreport"
      testdir = "pgtaptests"
	  TESTS_TOTAL = 0
	  TESTS_PASS = 0
	  TESTS_FAIL = 0
	  TESTS_SKIPPED = 0	        
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
                                // println sourceChanged[i]
                                //println isSourceChanged
                                sh "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -f ${sourceChanged[i]} -e >> ${env.WORKSPACE}/${env.pgreport}_${BUILD_NUMBER}_${i}.tap"
                                //sh "cat ${env.WORKSPACE}/${env.pgreport}_${BUILD_NUMBER}_${i}.tap"
                            }                            
                        }                     
                            if (!isSourceChanged) {
                                println "Source and Tests are not changed in this git commit so not running any tests. No rport will be generated or sent anywhere."
                                sh "exit 0" 
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
						def sample = parseTAPTests(currentBuild.currentResult)
						//Collect User (who did last git commit) details and time of job run 
						def user = sh(returnStdout: true, script: "git log -1 --pretty=format:'%an'").split()                     
						writeFile file: "report.txt", text: "${sample}"
						sh "cat report.txt" 
						 writeFile file: "message.json", text: "${sample}"
					    sh "cat message.json"					  
	                     def cmd = "curl  -XPOST 'http://${env.JENKINS_HOST}:9200/jenkinstest/jenkins' -H \"Content-Type: application/json\" -d \"@message.json\""
	                    sh 'echo $cmd'
	                    def response = sh(returnStdout: true, script: "curl  -XPOST 'http://${env.JENKINS_HOST}:9200/jenkinstest/jenkins' -H \"Content-Type: application/json\" -d \"@message.json\"")
                        sh "echo $response" 
	                
	                  } catch (Exception e) {
	                      e.printStackTrace()
	                      currentBuild.result = 'FAILURE'
	                  }  
	                }
	               
	              }
	            }   
	        }      
	    }
	
	
    }
}

@NonCPS
	def parseTAPTests(String resultpassed) {  
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
				  env.TESTS_FAIL =  action.getFailCount() 
	   			  def noOfTotalTests = action.getTotalCount()
				  env.TESTS_TOTAL = action.getTotalCount()	  
	   			  def noOfSkippedTests = action.getSkipCount()
	   			  env.TESTS_SKIPPED = action.getSkipCount()
				  def noOfPassedTests = noOfTotalTests - noOfFailedTests - noOfSkippedTests
                  env.TESTS_PASS =  noOfTotalTests - noOfFailedTests - noOfSkippedTests
	   			  def result = "SUCCESS"
	   			  if (noOfFailedTests > 0) {
	    				result = "FAILURE"
	   			  }       
	   			  def now = new Date()
	              def timee = now.format("yy/MM/dd.HH-mm", TimeZone.getTimeZone('UTC'))
	 			  println "TOTAL_NO_TESTS: ${noOfTotalTests}"
	 			  println "TOTAL_PASS_TESTS: ${env.TESTS_PASS}"
	 			  println "TOTAL_FAIL_TESTS: ${noOfFailedTests}"
	  			  println "TOTAL_RESULTS: ${result}"
	  			  println "TOTAL_TIME: ${timee}"
	 			  //putToFile = "${noOfTotalTests},${noOfPassedTests},${noOfFailedTests},${result},${timee}"
				  //def putToFile = "Sample Text"   
	 			  putToFile = "{\"Build_Number\": \"${BUILD_NUMBER}\", \"Job_Name\": \"${JOB_BASE_NAME}\", \"Job_Status\": \"${resultpassed}\", \"Triggered By\": \"${user}\", \"Triggered_Date\": \"${timee}\", \"TESTS_TOTAL:\": \"${noOfTotalTests}\", \"TESTS_PASS:\": \"${env.TESTS_PASS}\",\"TESTS_FAIL:\": \"${noOfFailedTests}\", \"TESTS_SKIPPED\": \"${noOfSkippedTests}\" }"	   
	 			  println "${putToFile}"
	         }
	       }
	       println "End of parseTAPTests function"
	    return putToFile.toString()
	 }