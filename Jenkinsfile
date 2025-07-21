pipeline {
  /*  
   * This uses the official Docker image (which includes `docker`), 
   * and gives it access to the host daemon via the socket.
   */
  agent {
    docker {
      image 'docker:20.10.16'                                     
      args  '-v /var/run/docker.sock:/var/run/docker.sock'        
    }
  }

  stages {
    stage('Build Docker Image') {
      steps {
        echo 'Building Docker image...'
        sh 'docker build -t louka-static-site .'
      }
    }

    stage('Run Docker Container') {
      steps {
        echo 'Running Docker container...'
        sh '''
          docker stop louka-site || true
          docker rm louka-site || true
          docker run -d --name louka-site -p 8080:12345 louka-static-site
        '''
      }
    }
  }

  post {
    success { echo '✅ Build and container startup successful!' }
    failure { echo '❌ Build failed!' }
  }
}
