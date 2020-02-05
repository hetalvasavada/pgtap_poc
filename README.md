# Database Unit Testing POC

Welcome to the Database Unit Testing POC project. This framework helps to run unit tests against a postgres database ( or a specialized Postgres like Greenplum database). 

# pgTAP
We have used pgTAP unit testing framework. PGTAP is a unit test tool used to validate the sql code for postgres database. The unit tests are similar to sql queries and there is very less learning curve involved to adopt pgtap.
pgTAP is Suite of TAP-emitting unit tests functions and Provides own functions which are readily available to write testcases.
It can be customized to create more functions which are not available
Link: https://pgtap.org/documentation.html

# PG_TAP_GEN: 
pg_tapgen is a command-line utility to generate pgTAP tests to validate a database schema by reading an existing database and generating the tests to match. You can get more details here: https://metacpan.org/pod/distribution/TAP-Parser-SourceHandler-pgTAP/bin/pg_tapgen 

This framework is helpful to catch the issues in the sql code early in the cycle by testing the sql code as soon as it is merged to a git repo. 
Using Pipeline as a code, we auto trigger Jenkins jobs to be built when any sql code is committed to the repository. 

When the job is running, it will create the test setup on-the-fly at runtime using docker containers. The container will have the test database against which the source and unit test files are run.

If there is no unit-test file for a particular source sql, then using the pg_tap_gen utility the pipeline will generate the testcases and it will be pushed on git in build number folder
The newly generated testcases using pgtap_gen have the structure based testcases for the sql code. 

# Pre-condition:
Clone and install all required applications using https://git.planittesting.com/jflorez/self-contained-jenkins-docker/tree/pgtap_poc

# Design:
When a build is triggered, it will fetch the list of files affected by the git commit, and process the list. If any source or test file is affected, it will run the corresponding unit test file against the test database. 

# GIT repository structure of pgtap_poc: 
1.Source file name: *.sql
2. Test file name: *_test.t
3. Files should be in respective paths

# Steps to Run when auto-trigger:
1. Auto Trigger: The Jenkins pipeline will be auto triggered when a change is committed to git
2. From UI: When the Job is triggered from Jenkins UI, it will fetch the latest git commit id and run the testcases flow against the files that were modified in the latest git commit.
NOTE: We are still working on auto-trigger part

# Steps to run jenkins job manually:
1. Open <IP>:8080 once Jenkins is up
2. There should be Jenkins job named "pgtap_poc_github" and click on build to run the job

# Testing Scenarios:
- Changes to only test files
- Changes source files which has testcases
- Change src file which does not have testcases
- Changes to both source & test files

# Reports
Detailed reports of pgTAP can be seen under "TAP Extended Test Results" tab in Jenkins
The test data is also being sent to an ELK stack for monitoring purposes. An elaborate dashboard will be present to check the trends and patterns of the tests results.
  
  
# Contact:
For more information, please contact  hvasavada@planittesing.com or nprabhu@planittesing.com .




