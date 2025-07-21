pipeline {
  agent any

  environment {
    // Jenkins credential (username/password or token) for Docker Hub
    DOCKERHUB = credentials('dockerhub-creds')
    // Your Docker Hub namespace/repo
    IMAGE     = "yourdockerhubuser/static-site"
    // Tag the image with the Jenkins build number
    TAG       = "${env.BUILD_NUMBER}"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build & Tag Docker Image') {
      steps {
        sh """
          docker build -t ${IMAGE}:${TAG} .
        """
      }
    }

    stage('Push to Docker Hub') {
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
      steps {
        echo "Cleaning workspace and pruning dangling images…"
        cleanWs()
        sh 'docker image prune -f'
      }
    }
  }
}
