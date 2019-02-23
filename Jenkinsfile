pipeline {
  agent any
  stages {
    stage('scm-checkout') {
      steps {
        git(url: 'https://github.com/froggy777/k8s-example', branch: 'master')
      }
    }
    stage('Build/push') {
      steps {
        sh '''echo "Here must be docker build/push commands"
echo "but we have only ls
pwd
ls -la'''
      }
    }
    stage('deploy') {
      steps {
        sh '''echo " Here should be deploy script"
echo "like \\"helm install project\\""
'''
      }
    }
  }
}