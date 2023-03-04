pipeline {
  agent {
    node {
      label 'jenkins'
    }

  }
  stages {
    stage('build') {
      steps {
        sh 'mvn clean package'
      }
    }

  }
}