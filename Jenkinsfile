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

        stage('terraform init') {
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
              docker { 
                image 'tfsec/tfsec-ci:v0.57.1' 
               
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

        // stage ('terraform apply') {
        //     steps {
        //         sh 'terraform apply -auto-approve'
        //     }
        // }

        stage('terraform destroy') {
            steps{
                sh 'terraform destroy -auto-approve'
            }
        }
    }

    post {
       always {
            // Steps that run whether the pipeline succeeds or fails
          cleanWs()  // Clean up the entire workspace
    }  
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