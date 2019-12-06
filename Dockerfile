FROM node:10-alpine

# Check the content of the container with
#   docker-compose run snap apk info -vv
# This is useful to check of the content of the container has changed

# v3.10 Installs Chromium 73
ENV ALPINE_REPO_TAG="v3.10" 

RUN apk update && apk upgrade && \
    echo @${ALPINE_REPO_TAG} http://nl.alpinelinux.org/alpine/${ALPINE_REPO_TAG}/community >> /etc/apk/repositories && \
    echo @${ALPINE_REPO_TAG} http://nl.alpinelinux.org/alpine/${ALPINE_REPO_TAG}/main >> /etc/apk/repositories && \
    apk add --no-cache \
      chromium@${ALPINE_REPO_TAG} \
      harfbuzz@${ALPINE_REPO_TAG} \
      nss@${ALPINE_REPO_TAG} \
      freetype@${ALPINE_REPO_TAG} \
      ttf-freefont@${ALPINE_REPO_TAG} \
      jq \
      py-pip && pip install awscli

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

COPY . /app
WORKDIR /app
RUN yarn install
