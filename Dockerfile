FROM jenkins/jenkins:lts

USER root

# Install AWS CLI
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
RUN rm awscli-bundle.zip
RUN mkdir /var/jenkins_home/.aws

# Setup Docker
RUN groupadd --gid 497 docker
RUN apt-get -y update
RUN apt-get -y install docker
RUN apt-get -y install redis-server
RUN apt-get -y install postgresql-9.6
RUN apt-get install -y libltdl7
RUN usermod -aG docker jenkins
#VOLUME /var/run/docker.sock

# Misc extra packages
RUN apt-get -y install jq

# Setup Postgres
#RUN /etc/init.d/postgresql start
#USER postgres
#RUN sleep 3
#RUN psql -c "CREATE USER jenkins;"
#RUN psql -c "ALTER USER jenkins WITH SUPERUSER;"

USER jenkins
