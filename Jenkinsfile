pipeline {
    agent any

    stages {
        stage('Code Checkout') {
            steps {
                git url: 'https://github.com/ASHISH1306-SUDO/AutoJava-App.git', branch: 'main'
            }
        }

        stage('Compile & Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Unit Test') {
            steps {
                sh 'mvn test'
            }
        }
    }
}
