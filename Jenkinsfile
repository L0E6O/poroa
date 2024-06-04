pipeline {
  agent any

  environment {
    DOCKER_IMAGE = "ubuntu"
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
            apt-get update
            apt-get install ca-certificates -y curl
            install -m 0755 -d /etc/apt/keyrings
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
            chmod a+r /etc/apt/keyrings/docker.asc

            echo \
            "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
            $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
            tee /etc/apt/sources.list.d/docker.list > /dev/null
            apt-get update && apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

            dockerd
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