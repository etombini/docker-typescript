FROM alpine:3.6

LABEL MAINTAINER "Elvis Tombini <github+docker-typescript@mapom.me>"

RUN apk --no-cache add nodejs nodejs-npm \
    && npm install -g typescript

RUN mkdir /home/user \
    && addgroup user \
    && adduser -h /home/user -D -s /bin/bash -G user user \
    && chown -R user:user /home/user

RUN mkdir /app \
    && chown -R user:user /app

USER user:user

WORKDIR /app
