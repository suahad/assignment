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
                sh 'docker build -t detector .'
            }
        }

  }
}
