FROM jenkins/jenkins:2.230

USER root
RUN apt-get update -qq && apt-get install -qqy apt-transport-https ca-certificates gnupg-agent software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update -qq && apt-get install -qqy docker-ce-cli && \
    groupadd docker && usermod -aG docker jenkins

COPY plugins.txt /var/jenkins_home
RUN /usr/local/bin/install-plugins.sh < /var/jenkins_home/plugins.txt
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
VOLUME /var/jenkins_home