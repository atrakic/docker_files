FROM jenkins/jenkins:lts

USER jenkins
COPY AnsiColorBuildWrapper.groovy /usr/share/jenkins/ref/init.groovy.d/ 
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
# RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
