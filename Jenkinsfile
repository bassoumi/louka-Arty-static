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
                    docker run -d --name louka-site -p 8080:8080 louka-static-site
                '''
            }
        }
    }
}
