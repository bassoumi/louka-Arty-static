pipeline {
    agent any

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
        success {
            echo '✅ Build and container startup successful!'
        }
        failure {
            echo '❌ Build failed!'
        }
    }
}
