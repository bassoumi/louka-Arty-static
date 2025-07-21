pipeline {
  agent any         // or replace with your specific node label

  stages {
    stage('Build') {
      steps {
        echo "Building..."
        sh '''
          # put your build commands here
          ls -la
        '''
      }
    }

    stage('Test') {
      steps {
        echo "Testing..."
        sh '''
          # put your test commands here
          echo "Test passed!"
        '''
      }
    }

    stage('Deliver') {
      steps {
        echo "Deliver..."
        sh '''
          # put your delivery commands here (or leave empty)
          echo "All done!"
        '''
      }
    }
  }
}
