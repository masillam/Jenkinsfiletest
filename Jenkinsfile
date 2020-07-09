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
                 stage('create artifact') {
                 steps {
                     sh 'rm -f artifact_code.zip'
                     zip zipFile: 'artifact_code.zip', archive: false, glob: '*.json,*.js'
                     archiveArtifacts artifacts: 'artifact_code.zip', fingerprint: true
                 }
                 }
                 stage('Docker build') {
                 steps {
                    sh "docker build -t nodejs_container ."
                 }
                 } 
                 stage('Lint') {
                 steps {
                     sh 'jshint **/*.js'             
                 }
                 }
                 stage('print working dir') {
                 steps {
                     sh 'istanbul cover ./test/*.js'
                 }    
                 }
                 stage('codeCoverage') {
                 steps {
                     sh 'istanbul cover ./test/*.js'
                 }
                 }   
      
              }
}
