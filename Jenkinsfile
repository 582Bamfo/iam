pipeline {
    agent any
    options {
        // Timeout counter starts AFTER agent is allocated
        timeout(time: 1, unit: 'HOURS')
    }
    stages {
        stage('git checkout') {
            steps {
                 git branch: 'main', url:'https://github.com/582Bamfo/iam.git'
            }
        }

        stage('git init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('fmt') {
            steps {
                sh 'terraform fmt'
            }
        }

          
        stage('tfsec') {
           agent {
            any { 
               image 'tfsec/tfsec-ci:v0.57.1' 
               reuseNode true
             }
           }
            steps {
             sh '''
              tfsec . --no-color
            '''
              }
        }
        stage ( 'plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage ('terraform apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }

        // stage('terraform destroy') {
        //     steps{
        //         sh 'terraform destroy -auto-approve'
        //     }
        // }
    }
    // post {
    //     success {
    //         emailext(
    //             subject: 'Jenkins Build Notification: Successful',
    //             body: 'The build was successful.',
    //             to: 'bamfodaniel@yahoo.com'
    //         )
    //     }
    // }
}