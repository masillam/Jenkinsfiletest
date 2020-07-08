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
                     sh 'mkdir archive'
                     zip zipFile: 'test.zip', archive: false, glob: '*.json,*.js'
                     archiveArtifacts artifacts: 'artifact.zip', fingerprint: true
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
                 stage('Two') {
                 steps {
                    input('Do you want to proceed?')
                 }
                 }
                 stage('Three') {
                 when {
                       not {
                            branch "master"
                       }
                 }
                 steps {
                       echo "Hello"
                 }
                 }
                 stage('Four') {
                 parallel { 
                            stage('Unit Test') {
                           steps {
                                echo "Running the unittest..."
                           }
                           }
                            stage('Integration test') {
                              agent {
                                    docker {
                                            reuseNode true
                                            image 'ubuntu'
                                           }
                                    }
                              steps {
                                echo "Running the integration test..."
                              }
                           }
                           }
                           }
              }
}
