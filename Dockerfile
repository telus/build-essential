FROM node:alpine
LABEL name="build-essential"
LABEL description="Node Build Essential Docker Image"
LABEL maintainer="Ahmad Nassri <ahmad.nassri@telus.com>"

RUN apk add \
  --update \
  --no-cache \
  bash \
  ca-certificates \
  chromium \
  chromium-chromedriver \
  g++ \
  git \
  make \
  musl-dev \
  openssh \
  py-pip
RUN pip install yamllint

USER node

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV CHROMEDRIVER_FILEPATH=/usr/bin/chromedriver
ENV MANPATH=$MANPATH:$NPM_CONFIG_PREFIX/share/man
ENV NODE_PATH=$NPM_CONFIG_PREFIX/lib/node_modules
ENV PATH=$PATH:$NPM_CONFIG_PREFIX/bin

RUN npx install-group peer \
  --package @telus/build-essential \
  --global
