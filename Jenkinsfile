node {
    def app
    env.DOCKER_NAME = params.DOCKER_NAME

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
      dir(env.GIT_PATH) {
        app = docker.build("${env.DOCKER_NAME}:${env.BUILD_ID}")
      }
    }

    stage('Push image') {
        docker.withRegistry('https://${env.REGISTRY_HOST}:${env.REGISTRY_PORT}',
        '${env.REGISTRY_USERNAME}' ) {
            app.push()
        }
    }
}
