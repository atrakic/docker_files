FROM jenkins/jenkins:lts

ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
ENV CASC_JENKINS_CONFIG="/var/jenkins_home/jenkins.yaml"

USER root
RUN echo "deb http://apt.dockerproject.org/repo debian-jessie main" \
      > /etc/apt/sources.list.d/docker.list \
     && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
     --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
     && apt-get update -qq \
     && DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends sudo apt-transport-https docker-engine make \
     && rm -rf /var/lib/apt/lists/*

RUN sudo usermod -a -G docker jenkins
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
COPY resources/security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
COPY resources/executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
COPY resources/env.groovy /usr/share/jenkins/ref/init.groovy.d/env.groovy
COPY resources/csrf.groovy /usr/share/jenkins/ref/init.groovy.d/csrf.groovy

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
USER root
