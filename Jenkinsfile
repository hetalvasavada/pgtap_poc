import hudson.model.*

 pipeline {
  agent any
  environment {
   POSTGRES_HOST = "localhost"
   POSTGRES_USER = "postgres"
   pgreport = "pgtapreport"
   testdir = "testcases"
   srcdir = "src"
   EMAIL_TO = 'naina.prabhu@iag.com.au, hetal.vasavada@iag.com.au'
  }

  stages {
   stage('run!') {
    steps {
     script {
      sh "docker build -t pgtapjenkins:${BUILD_NUMBER} -f Dockerfile ."
      docker.image("pgtapjenkins:${BUILD_NUMBER}").withRun("-h localhost -e POSTGRES_USER=postgres -v ${env.WORKSPACE}:/tmp/tests") {
      db -> docker.image("pgtapjenkins:${BUILD_NUMBER}").inside("--link ${db.id}:db") {
       
      sh '''
    	 psql --version
    	 until psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -c "select 1" > /dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
    	 echo "Waiting for postgres server, $((RETRIES-=1)) remaining attempts..."
    	 sleep 1
    	 done
       '''
				  

        sh 'echo "Running DB Prerequisites to create pgtap extension"'
        sh '/db_prereqs.sh ${POSTGRES_HOST} ${POSTGRES_USER}'

        // Get list of changed files list and check if it contains pgtaptests in it::
        List<String> gitChanged = sh(returnStdout: true, script: "git whatchanged -n 1").split()
        
        def isgitChanged = false
        for (int i = 0; i < gitChanged.size(); i++) {
          if (gitChanged[i].contains("${env.testdir}")) {
	      ispgTAP = true
              println "${gitChanged[i]}"
              // Found some new/edited tests files to be run under testcases folder, so run each one:
              isgitChanged = true
              sh "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -f ${gitChanged[i]} -e >> ${env.WORKSPACE}/${env.pgreport}_${BUILD_NUMBER}_${i}.tap"
               
         }

          if (gitChanged[i].contains("${env.srcdir}")) {
	      ispgTAP = true
              println "source: ${gitChanged[i]}"
              isgitChanged = true 
               def testFileName = getTestFileName(gitChanged[i])
               println "${testFileName}"
               println "${env.WORKSPACE}/${testdir}/${testFileName}"
                   if (fileExists("${env.WORKSPACE}/${testdir}/${testFileName}")) {
                        println "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -f ${env.WORKSPACE}/${testdir}/${testFileName} -e >> ${env.WORKSPACE}/${env.pgreport}_${BUILD_NUMBER}_${i}.tap"
                        sh "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -f ${env.WORKSPACE}/${testdir}/${testFileName} -e >> ${env.WORKSPACE}/${env.pgreport}_${BUILD_NUMBER}_${i}.tap"
                        //Pass the source file name, the method will calculate test file name and remove entry for test file name in next line.
                        gitChanged = removeCorrespondingElementFromList(gitChanged, "${gitChanged[i]}")
                        aretestsrun = true
                   } 
        		   else {
        		   	    sh "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -f ${gitChanged[i]} -e >> ${env.WORKSPACE}/${env.pgreport}_${BUILD_NUMBER}_${i}.sql"
						sh "cat ${env.WORKSPACE}/${env.pgreport}_${BUILD_NUMBER}_${i}.sql"
						sh 'echo "Running pg_tapgen......"'
						sh '''
						   git clean -f
						   mkdir ${BUILD_NUMBER}
						   ls
						   cd ${BUILD_NUMBER}    
						   ls					   
						   pg_tapgen -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -d postgres
						   ls
						   cat table_sample_schema.mv_motor_sensor.sql
						   '''
						   sh 'git add --all'
           					   sh 'git commit -m "Merged to master"'
                                                   withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'hetal_github', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD']]) {
          					   sh "git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/hetalvasavada/pgtap_poc.git HEAD:master"
						   }
                        println "There is no pgTap Unit Test Script corresponding to Dev Code  so creating testcases...Please extend and execute testcases in next run! "
                        currentBuild.result = 'FAILURE'
                        sh "exit 1"
                   }
                 }
                }
                
        if (!isgitChanged) {
	ispgTAP = false
         println "Source and Tests are not changed in this git commit so not running any tests. No rport will be generated or sent anywhere."
         sh "exit 0"
        }

      //  sh "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -f testcases/sample_schema1/functions/function1_test.t -e >> ${env.WORKSPACE}/${env.pgreport}${BUILD_NUMBER}.tap"
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
     //Next step is to gather data to send to ELK
     script {
	     if(ispgTAP){
     def sample = ""
      try {
       println "Parse and get results data from TAP PLugin APIs"
       timestamps {
        logstash {
         sample = parseTAPTests()
        }
       }
       
       def now = new Date()
       //Collect User (who did last git commit) details and time of job run 
       def user = sh(returnStdout: true, script: "git log -1 --pretty=format:'%an'").split()
       
       //writeFile file: "message.json", text: "${jsoncontent}"
       def timee = now.format("yyyy/MM/dd HH:mm:ss", TimeZone.getTimeZone('UTC'))
       writeFile file: "message.json", text: "{ \"job_name\": \"${JOB_NAME}\", \"build_number\": ${BUILD_NUMBER}, \"triggered_by\": \"${user}\", \"triggered_date\": \"${timee}\", ${sample} } "
       sh "cat message.json"
   //    def cmd = "curl  -XPOST 'http://nswsydnlp353:9200/jenkinstest/jenkins' -H \"Content-Type: application/json\" -d \"@message.json\""
       def response = sh(returnStdout: true, script: "curl  -XPOST 'http://nswsydnlp356:9200/jenkinstest/jenkins' -H \"Content-Type: application/json\" -d \"@message.json\"")
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
 for (def action: currentJob.actions) {
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
 //println "TOTAL_NO_TESTS: ${noOfTotalTests} , TOTAL_PASS_TESTS: ${noOfPassedTests}, TOTAL_FAIL_TESTS: ${noOfFailedTests}, TOTAL_RESULTS: ${result}"
 //putToFile = "\"Job_Status\": \"${result}\", \"TESTS_TOTAL\": \"${noOfTotalTests}\", \"TESTS_PASS\": \"${noOfPassedTests}\",\"TESTS_FAIL\": \"${noOfFailedTests}\", \"TESTS_SKIPPED\": \"${noOfSkippedTests}\" "
 putToFile = " \"tests_total\": ${noOfTotalTests}, \"tests_passed\": ${noOfPassedTests}, \"tests_failed\": ${noOfFailedTests}, \"tests_skipped\": ${noOfSkippedTests}, \"status\": \" ${result}\" "    
 println "Done....End of parseTAPTests function"
 return putToFile.toString()
}

def removeCorrespondingElementFromList(List < String > gitChanged, String removeItem) {
 // Remove corresponding test code item from list if exists for a particular test script.
 def sitem = removeItem.split('/')
 def srcName = "${sitem[3]}"
 def onlyName = srcName.substring(0, srcName.length() - 4);
 //println "File to be removed from list: ${onlyName[0]}.sql"
 println "File to be removed from list: ${onlyName}_test.t"
 gitChanged.removeAll {
 it.contains("${onlyName}_test.t")
 }
 return gitChanged
}

def getTestFileName(String srcFileName) {
 def sitem = srcFileName.split('/')
 def srcFileLeng=sitem.size()
 println "${srcFileLeng} ******************"
 def srcName = "${sitem[srcFileLeng-1]}"
 sh "echo src File Name: ${srcName}"
 def str11 = ""
 if (srcFileName.contains(".sql")) {
  str11 = srcName.substring(0, srcName.length() - 4);
 } else {
  str11 = "${srcName}"
 }
 return "${sitem[1]}/${sitem[2]}/${str11}_test.t"
 
}
