FROM alpine:3.21

ENV JPLAG_VERSION=5.1.0

RUN apk update
RUN apk add --no-cache bash openjdk21

WORKDIR /jplag-bin

COPY scripts/entrypoint.sh .

RUN wget https://github.com/jplag/JPlag/releases/download/v$JPLAG_VERSION/jplag-$JPLAG_VERSION-jar-with-dependencies.jar
RUN mv jplag-$JPLAG_VERSION-jar-with-dependencies.jar jplag-jar-with-dependencies.jar

WORKDIR /jplag

ENTRYPOINT ["/bin/bash", "/jplag-bin/entrypoint.sh"]
