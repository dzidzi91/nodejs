pipeline {
  agent any
  stages {
    stage('NPM install') {
      steps {
        sh '''npm init
npm ci'''
      }
    }

    stage('Build') {
      steps {
        sh 'npm build'
      }
    }

    stage('Test') {
      steps {
        sh 'npm test'
      }
    }

    stage('Successfuly') {
      steps {
        error 'Everything is okay/ Failure'
      }
    }

  }
}