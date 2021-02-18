# Jenkins Integration Test (Infrastructure as Code)

### Summary

Current project is a tryout of creation of regression test infrastructure for Web UI application on continuous integration platform - Jenkins.
As application under test (AUT) was chosen [Bitnami Orange-HRM](https://www.orangehrm.com/) 
All infrastructure components based on Docker containers. Current implementation targeted only for local deployment with
help of Docker-on-Docker approach through host Docker Engine API.  

### What's in the box
Fully provisioned and ready to go Jenkins master inside docker-container. Jenkins contains single Jenkins job
`itegration-pipeline` based on declarative Jenkinsfile with multiple stages. There's no application build stages
(only test ones) as used already existing docker image provided by Bitnami.
Container provisioning and termination performed with Ansible which preinstalled with Jenkins master image.
As integration test framework used [Selenium/TestNG](https://github.com/ehabibov/selenium-testng).

### Requirements

- Docker (v19) and docker-compose (v1.25)
- MacOS (other OS not tested yet)
- 8-10 GB RAM

### Deploy
 
Jenkins installation:  
`ci/startup.sh`  
Jenkins startup process could take ~15 mins. 

Cleanup:  
`ci/cleanup.sh`

Pay attention that cleanup script deletes not only anything related to current project, but also all unattached docker volumes on a current machine.
Browser images should be deleted manually.  
Also consider `portainer.yml` docker-compose file to launch docker management application.  

### Usage
Open Jenkins on http://localhost:9080. Login credentials could be found in `jcasc-config/config.yaml`
There is only one pre-configured job - `integration-pipeline`. Process to job execution with
`Build (now)` button. Job will fail and then this button will be replaced with `Build with Parameters`. Pick
required browser type with it's version and start execution. Build process could be tracked on BlueOcean accessible from build page.
At the end Allure report should be generated in case build and/or test successful.

http://localhost:8080 - application, accessible after `Deploy application env` stage  
http://localhost:3306 - MySQL, accessible after `Deploy application env` stage    
http://localhost:9090 - Selenoid UI, accessible after `Deploy selenoid env` stage  

At some point during `Integration test` stage Selenoid UI will display test behavior on application web UI.   