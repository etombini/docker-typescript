FROM ubuntu:16.04

LABEL MAINTAINER "Elvis Tombini <github+docker-typescript@mapom.me>"

RUN apt-get update \
    && apt-get -yyq install npm \
    && ln -s /usr/bin/nodejs /usr/bin/node \
    && npm install -g typescript

ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
    && chown -R user:user $HOME

RUN mkdir /app \
    && chown -R user:user /app

WORKDIR /app
