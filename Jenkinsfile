pipeline {
    agent any
	
    environment {
        DOCKER_IMAGE = "ashish2909/autojava-app"
        DOCKER_TAG = "${env.BUILD_NUMBER}"
        REGISTRY_CREDENTIALS = 'dockerhub-creds-id'
    }

    stages {
        stage('Code Checkout') {
            steps {
                echo "🔍 Checking out code from GitHub"
                git url: 'https://github.com/ASHISH1306-SUDO/AutoJava-App.git', branch: 'main'
            }
        }

        stage('Compile & Build') {
            steps {
                echo "⚙️ Running Maven build: mvn clean package -DskipTests"
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Unit Test') {
            steps {
                echo "🧪 Running unit tests"
                sh 'mvn test'
            }
        }

        stage('Archive Artifacts') {
            steps {
                echo "📦 Archiving JAR files from target/"
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🐳 Building Docker image: ${DOCKER_IMAGE}:${DOCKER_TAG}"
                sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
            }
        }

        stage('Push to Docker Registry') {
            steps {
                echo "🚀 Pushing Docker image to registry: ${DOCKER_IMAGE}:${DOCKER_TAG}"
                withCredentials([usernamePassword(credentialsId: "${REGISTRY_CREDENTIALS}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh """
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
                    """
                }
            }
        }
    }
}
