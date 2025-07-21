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
        // Pull from your GitHub project
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
      // re‑enter a node context so cleanWs() has a workspace to work on
      node {
        echo "Cleaning workspace and pruning dangling images…"
        cleanWs()
        sh 'docker image prune -f'
      }
    }
  }
}
