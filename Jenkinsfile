pipeline {
    agent any
    //options {
        // Timeout counter starts AFTER agent is allocated
     //   timeout(time: 1, unit: 'SECONDS')
   // }
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
        success {
            echo 'Pipeline run was successful'
        }
    }
}