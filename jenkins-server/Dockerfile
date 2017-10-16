FROM jenkins:alpine

USER jenkins
COPY AnsiColorBuildWrapper.groovy /usr/share/jenkins/ref/init.groovy.d/ 
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/

COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
