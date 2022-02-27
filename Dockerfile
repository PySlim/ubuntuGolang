FROM ubuntu:20.04


RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update && apt-get install -y curl 
RUN apt-get install -y wget gcc
RUN apt-get update 

RUN wget -P /tmp https://go.dev/dl/go1.17.7.linux-amd64.tar.gz
RUN apt-get -y autoclean

RUN tar -C /usr/local -xzf /tmp/go1.17.7.linux-amd64.tar.gz
RUN rm /tmp/go1.17.7.linux-amd64.tar.gz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

# instalando git
RUN apt-get install -y git
RUN apt-get install nano -y

#configurando git 
RUN git config --global user.email 'slim.zegarra@panbox.io'
RUN git config --global user.name 'Slim Josh Zegarra Soto'

WORKDIR $GOPATH

