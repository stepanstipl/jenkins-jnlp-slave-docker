FROM jenkinsci/jnlp-slave:alpine

# THis is CoreOS default for Docker
ENV DOCKER_GID=233

USER root
RUN apk add --no-cache docker \
                       shadow \
                       sudo \
  && usermod -G docker jenkins

ADD jenkins-docker /usr/local/bin/jenkins-docker

ENTRYPOINT ["/usr/local/bin/jenkins-docker"]
