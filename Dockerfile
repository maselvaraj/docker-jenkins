FROM jenkins:1.570
MAINTAINER Manivannan Selvaraj <citizenmani@gmail.com>

USER root
RUN apt-get update && apt-get install -y sudo && apt-get install maven -y sudo && apt-get install python-pip python-dev build-essential -y sudo && pip install awscli && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
 
USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
