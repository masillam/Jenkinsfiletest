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
                     sh 'rm -f artifact_code.zip'
                     zip zipFile: 'artifact_code.zip', archive: false, glob: '*.json,*.js'
                     archiveArtifacts artifacts: 'artifact_code.zip', fingerprint: trueomeCodeThatCanBeErrored
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
