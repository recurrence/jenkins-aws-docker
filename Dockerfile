FROM jenkins/jenkins:lts

USER root

# Install AWS CLI
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
RUN rm awscli-bundle.zip
RUN mkdir /var/jenkins_home/.aws

# Setup Docker
RUN groupadd --gid 999 docker
RUN apt-get -y update
RUN apt-get -y install docker
RUN usermod -aG docker jenkins
VOLUME /var/run/docker.sock

USER jenkins

