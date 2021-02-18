FROM jenkins/jenkins:2.280

USER root
RUN apt-get update -qq && \
    apt-get install -qqy python2.7 apt-transport-https ca-certificates gnupg-agent software-properties-common jq && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update -qq && apt-get install -qqy docker-ce-cli && \
    groupadd docker && usermod -aG docker jenkins

RUN apt-get update -qq && apt-get install -qqy software-properties-common && \
    curl https://bootstrap.pypa.io/2.7/get-pip.py -o get-pip.py && \
    python2.7 get-pip.py && \
    pip install requests docker-py && \
    apt-add-repository "deb [arch=amd64] http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    apt-get update -qq && apt-get install -qqy ansible

COPY plugins.txt /var/jenkins_home
RUN /usr/local/bin/install-plugins.sh < /var/jenkins_home/plugins.txt
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
VOLUME /var/jenkins_home