pipeline {
  agent any
  stages {
    stage('scm-checkout') {
      steps {
        git(url: 'https://github.com/froggy777/k8s-example', branch: 'master')
      }
    }
    stage('Build/push') {
      parallel {
        stage('Build/push') {
          steps {
            dir(path: '/opt') {
              sh '''echo "Here must be docker build/push commands"
echo "but we have only ls"
pwd
ls -la'''
            }

          }
        }
        stage('Stage-2') {
          steps {
            dir(path: '/opt/api') {
              sh '''echo "another dir"
pwd
ls -la'''
            }

          }
        }
        stage('Stage-3') {
          steps {
            dir(path: '/opt/front') {
              sh '''echo "this is front dir"
pwd
ls -la'''
            }

          }
        }
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