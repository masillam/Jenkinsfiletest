
# Jenkins NodeJS HelloWorld

A minimal example project for the NodeJS application that covers linting, code coverage and unit tests:

 * the `Jenkinsfile` describes **HOW** to build this project using Docker version of Jenkins
docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts



## How it works

This example will be built on  [problem-1](https://github.com/masillam/Problem_1/blob/master/Dockerfile)  and the NodeJS application runs inside Docker with all required dependencies build in the Image.

The `Jenkinsfile` in here describes **HOW** this project is built, in terms of the individual stages that make up the build pipeline and what happens within them:

```groovy
pipeline {
         agent any
         stages {
                 stage('Checkout') {
                 steps {
                     checkout scm
                 }    
                 }     
                 stage('Assemble dependencies') {
                 steps {
                     sh 'npm install'
                 }
                 }
                 stage('Execute unit tests') {
                 steps {
                     sh 'npm test'
                 }
                 }
                 stage('Linting') {
                 steps {
                     catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE')
                     {
                          sh 'jshint **/*.js' 
                     }
                }
                }  
                 stage('Create Artifact') {
                 steps {
                     catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE')
                     {
                     sh 'rm -f artifact_code.zip'
                     zip zipFile: 'artifact_code.zip', archive: false, glob: '*.json,*.js'
                     archiveArtifacts artifacts: 'artifact_code.zip'
                     }
                 }
                 }
                 stage('codeCoverage') {
                 steps {
                     sh 'istanbul cover ./test/*.js'
                 }
                 }   
                 stage('Docker build') {
                 steps {
                    sh "docker build -t nodejs_container ."
                 }
                 } 
      
              }
}
```

The `master` branch build produces the below output:

![image](https://github.com/masillam/Problem_1/blob/master/Jenkins2.PNG)

