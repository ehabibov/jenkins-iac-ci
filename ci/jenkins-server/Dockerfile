FROM jenkins/jenkins:2.224

COPY plugins.txt /var/jenkins_home
RUN /usr/local/bin/install-plugins.sh < /var/jenkins_home/plugins.txt
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
VOLUME /var/jenkins_home