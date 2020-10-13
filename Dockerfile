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

ENV VERSION "1.8.14"
ENV PLATFORM "linux64"

WORKDIR /arduino/build
RUN ant dist -Dplatform=${PLATFORM} -Dversion=${VERSION}

WORKDIR /opt/
RUN tar xvf /arduino/build/linux/arduino-${VERSION}-${PLATFORM}.tar.xz && mv arduino-${VERSION} arduino
    
