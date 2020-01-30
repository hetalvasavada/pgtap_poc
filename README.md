# Database Unit Testing POC

Welcome to the Database Unit Testing POC project. This framework helps to run unit tests against a postgres database ( or a specialized Postgres like Greenplum database).

This framework is helpful to catch the issues in the sql code early in the cycle by testing the sql code as soon as it is merged to a git repo. 
Using Pipeline as a code, we auto trigger Jenkins jobs to be built when any sql code is committed to the repository. 

When the job is running, it will create the test setup on-the-fly at runtime using docker containers. The container will have the test database against which the source and unit test files are run.

If there is no unit-test file for a particular source sql, then using the pg_tap_gen utility the pipeline will generate the testcases so that all code can be effectively tested.
The newly generated testcases using pgtap_gen have the structure based testcases for the sql code. 
TO-DO: An enhancement is planned to push the generated test cases to the git repo under a folder for the test files generated using pg_tap_gen utility.

#Steps to Run:
1. Auto Trigger: The Jenkins pipeline will be auto triggered when a change is committed to git
2. From UI: When the Job is triggered from Jenkins UI, it will fetch the latest git commit id and run the testcases flow against the files that were modified in the latest git commit.

#Unit Test Tools:
1. PGTAP: PGTAP is a unit test tool used to validate the sql code for postgres database. The unit tests are similar to sql queries and there is very less learning curve involved to adopt pgtap. You can find out more about this tool at https://pgtap.org/
2. PG_TAP_GEN: pg_tapgen is a command-line utility to generate pgTAP tests to validate a database schema by reading an existing database and generating the tests to match. You can get more details here: https://metacpan.org/pod/distribution/TAP-Parser-SourceHandler-pgTAP/bin/pg_tapgen 
3. 





