FROM node:alpine
LABEL name="build-essential"
LABEL description="Node Build Essential Docker Image"
LABEL maintainer="Ahmad Nassri <ahmad.nassri@telus.com>"

RUN apk add --update --no-cache ca-certificates git openssh py-pip curl
run pip install yamllint

USER node

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:$NPM_CONFIG_PREFIX/bin
ENV MANPATH=$MANPATH:$NPM_CONFIG_PREFIX/share/man
ENV NODE_PATH=$NPM_CONFIG_PREFIX/lib/node_modules

RUN npx install-group peer --package @telus/build-essential --global
