pipeline {
  agent any

  environment {
    DOCKER_IMAGE = "."
    GITHUB_REPO = "https://github.com/L0E6O/poroa.git"
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
          docker.build("${DOCKER_IMAGE}")
        }
      }
    }

    stage('Run Container') {
      steps {
        script {
          docker.image("${DOCKER_IMAGE}").run()
        }
      }
    }

    stage('Clean Up') {
      steps {
        script {
          docker.image("${DOCKER_IMAGE}").remove()
        }
      }
    }
  }
}