FROM 0x01be/arduino:build-arm32v6 as build

FROM 0x01be/xpra:arm32v6

COPY --from=build /opt/arduino/ /opt/arduino/

USER root
RUN apk add --no-cache --virtual arduino-runtime-dependencies \
    openjdk8 \
    bash \
    unzip \
    tar \
    xz

USER xpra

ENV PATH ${PATH}:/opt/arduino/

ENV COMMAND arduino

