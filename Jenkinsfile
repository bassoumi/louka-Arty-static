pipeline {
  agent any

  environment {
    DOCKERHUB = credentials('dockerhub-creds')
    IMAGE     = "yourdockerhubuser/static-site"
    TAG       = "${env.BUILD_NUMBER}"
  }

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Build & Tag') {
      steps {
        sh """
          docker build -t ${IMAGE}:${TAG} .
        """
      }
    }

    stage('Push') {
      steps {
        sh """
          echo "$DOCKERHUB_PSW" | docker login \
            --username "$DOCKERHUB_USR" \
            --password-stdin
          docker push ${IMAGE}:${TAG}
        """
      }
    }
  }

  post {
    always {
      cleanWs()
      sh 'docker image prune -f'
    }
  }
}
