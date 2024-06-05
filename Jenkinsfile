pipeline {
    agent {
        docker {
            label 'Docker'
            image 'docker'
        }
    }

    environment {
        GITHUB_REPO = 'https://github.com/L0E6O/poroa.git'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']],
                 userRemoteConfigs: [[url: env.GITHUB_REPO]]])
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('/Users/leo/Desktop/jenkins/Dockerfile')
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh '''#!/bin/zsh
                    /usr/local/bin/docker run docker'''
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    docker.image("docker").remove()
                }
            }
        }
    }
}
