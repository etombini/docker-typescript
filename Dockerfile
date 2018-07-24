FROM alpine:latest

LABEL MAINTAINER "Elvis Tombini <github+docker-typescript@mapom.me>"

RUN apk --no-cache add nodejs nodejs-npm \
    && npm install -g typescript

ENV HOME /home/user
RUN adduser -h $HOME -D user

RUN mkdir /app \
    && chown -R user:user /app

WORKDIR /app
