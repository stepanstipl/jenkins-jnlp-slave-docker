FROM jenkinsci/jnlp-slave:alpine

# THis is CoreOS default for Docker
ENV DOCKER_GID=233

USER root
RUN apk add --no-cache docker \
                       shadow \
                       sudo \
  && usermod -G docker jenkins

ADD jenkins-docker /usr/local/bin/jenkins-docker

# This makes it compatible with Docker Pipeline Plugin
VOLUME /home/jenkins/workspace

ENTRYPOINT ["/usr/local/bin/jenkins-docker"]
