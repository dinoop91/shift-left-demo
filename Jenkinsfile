pipeline {
    agent any

    stages {
        stage('Build Image') {
            steps {
                sh '''
                  docker build -t docker.io/dinoopnair/shiftleft-demo:v1 .
                '''
            }
        }

        stage('Trivy Image Scan (Build Phase)') {
            steps {
                sh '''
                  trivy image \
                    --format json \
                    --output trivy-build.json \
                    docker.io/dinoopnair/shiftleft-demo:v1
                '''
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'trivy-build.json', fingerprint: true
        }
    }
}

