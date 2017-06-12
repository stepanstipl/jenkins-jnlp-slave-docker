FROM jenkinsci/jnlp-slave:alpine

USER root
RUN apk add --no-cache docker

USER jenkins
