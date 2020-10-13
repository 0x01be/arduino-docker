FROM alpine as build

RUN apk add --no-cache --virtual arduino-build-dependencies \
    git \
    build-base \
    perl \
    openjdk8 \
    apache-ant \
    unzip \
    tar \
    xz

ENV ARDUINO_REVISION master
RUN git clone --depth 1 --branch ${ARDUINO_REVISION} https://github.com/arduino/Arduino.git /arduino

WORKDIR /arduino/build
RUN ant dist -Dplatform=linux64 -Dversion=1.8.14
    
