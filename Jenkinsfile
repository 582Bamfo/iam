pipeline {
    agent any
    //options {
        // Timeout counter starts AFTER agent is allocated
     //   timeout(time: 1, unit: 'SECONDS')
   // }
    stages {
        stage('git checkout') {
            steps {
                 git branch: 'master', url:'https://github.com/582Bamfo/iam.git'
            }
        }

        stage('git init') {
            steps {
                sh 'terraform init'
            }
        }

        stage("terraform fmt") {
            steps {
                sh "terraform fmt"
            }
        }
        stage ("terraform plan") {
            steps {
                sh "terraform plan"
            }
        }

        stage ("terraform apply") {
            steps {
                sh "terraform apply -auto-approve"
            }
        }
    }
}