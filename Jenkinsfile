pipeline {
    agent any
    options {
        // Timeout counter starts AFTER agent is allocated
        timeout(time: 1, unit: 'SECONDS')
    }
    stages {
        stage('git checkout') {
            steps {
                git 'Hello World'
            }
        }
    }
}