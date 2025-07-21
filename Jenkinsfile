pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        // clone your GitHub project
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        // build & tag locally
        sh 'docker build -t static-site:latest .'
      }
    }

    stage('Smoke Test') {
      steps {
        // verify the image runs (prints Nginx version or similar)
        sh '''
          CONTAINER=$(docker run -d static-site:latest)
          echo "Ran container $CONTAINER"
          docker logs $CONTAINER || true
          docker rm -f $CONTAINER
        '''
      }
    }
  }

  post {
    always {
      echo 'Cleaning workspace & pruning images…'
      cleanWs()
      // remove dangling images
      sh 'docker image prune -f'
    }
  }
}
