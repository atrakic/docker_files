FROM jenkins/jenkins:lts

ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

USER root
RUN echo "deb http://apt.dockerproject.org/repo debian-jessie main" \
      > /etc/apt/sources.list.d/docker.list \
     && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
     --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
     && apt-get update \ 
     && apt-get install -y --no-install-recommends sudo apt-transport-https docker-engine make \
     && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose; \
    chmod +x /usr/local/bin/docker-compose

RUN sudo usermod -a -G docker jenkins
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers 

USER jenkins
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
COPY env.groovy /usr/share/jenkins/ref/init.groovy.d/env.groovy
COPY csrf.groovy /usr/share/jenkins/ref/init.groovy.d/csrf.groovy

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
