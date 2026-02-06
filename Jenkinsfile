pipeline {
    agent any

    stages {
        stage('Build Image') {
            steps {
                sh '''
                  docker build -t shiftleft-demo:v1 .
                '''
            }
        }

        stage('Trivy Image Scan (Build Phase)') {
            steps {
                sh '''
                  trivy image \
                    --format json \
                    --output trivy-build.json \
                    shiftleft-demo:v1
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

