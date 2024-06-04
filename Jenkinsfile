pipeline {
  agent any

  environment {
    DOCKER_IMAGE = "mio-ubuntu-test"
    DOCKER_TAG = "latest"
    GITHUB_REPO = "https://github.com/tuouser/tuarepo.git"
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
          docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
        }
      }
    }

    stage('Run Container') {
      steps {
        script {
          docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").run()
        }
      }
    }

    stage('Clean Up') {
      steps {
        script {
          docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").remove()
        }
      }
    }
  }
}