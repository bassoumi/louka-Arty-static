pipeline {
  agent {
    dockerContainer {
      image 'my-jenkins-agent-with-docker'
      dockerHost 'tcp://host.docker.internal:2376'
      // if your workspace inside is different, you can also set:
      // remoteFs '/home/jenkins/agent'
    }
  }

  stages {
    stage('Build Docker Image') {
      steps {
        sh 'docker version'                         // verify client+daemon connectivity
        sh 'docker build -t louka-static-site .'
      }
    }

    stage('Run Docker Container') {
      steps {
        sh '''
          docker stop louka-site || true
          docker rm louka-site || true
          docker run -d --name louka-site -p 8080:12345 louka-static-site
        '''
      }
    }
  }
}
