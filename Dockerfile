FROM alpine:3.7

ARG BUILD_DATE
ARG VERSION
LABEL build_version="Modern Skyblock 3 version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="cinnamennen"

RUN apk --update add openjdk8-jre

EXPOSE 25565

ADD https://minecraft.curseforge.com/projects/modern-skyblock-3-departed/files/2536782/download /

RUN mkdir /server

RUN unzip download -d /server

RUN rm /download

WORKDIR /server

RUN echo <<EOF
[
  {
    "uuid": "7cbe0780-e542-4a11-a30f-93e3246ec044",
    "name": "cinnamennen",
    "level": 4
  }
]
EOF > ops.json

CMD java -Xms4096M -Xmx4096M -jar forge-1.12.2-14.23.2.2611-universal.jar nogui pause
