FROM node:alpine
LABEL name="build-essential"
LABEL description="Node Build Essential Docker Image"
LABEL maintainer="Ahmad Nassri <ahmad.nassri@telus.com>"

RUN apk add --update --no-cache ca-certificates git openssh

USER node

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

RUN mkdir ~/.ssh
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN npx install-peerdeps --only-peers --global @telus/build-essential
