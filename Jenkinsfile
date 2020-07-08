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
                 stage('Build and run code') {
                 steps {
                     sh 'npm run-script run'             
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
