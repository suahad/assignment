pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'mvn clean package'
      }
    }
    stage('Docker Build') {
            steps {
                sh 'mkdir -p docker'
                sh 'docker build -t detector .'
            }
        }

  }
}
