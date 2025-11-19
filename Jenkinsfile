pipeline {
    agent any

    stages {
        stage('code-checkout') {
            steps {
                git url: 'https://github.com/ASHISH1306-SUDO/AutoJava-App.git', branch: 'master'
            }
        }

        stage('compile & Build') {
            steps {
                sh 'mvn clean package -Dskiptests'
            }
        }

        stage('Test') {
            sh 'mvn test'
        }
    }
}
