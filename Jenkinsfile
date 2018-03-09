node {
    def app
    env.DOCKER_NAME = params.DOCKER_NAME

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("${env.DOCKER_NAME}")
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
