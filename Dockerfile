FROM ubuntu:14.04

MAINTAINER Chris Daish <chrisdaish@gmail.com>

# ReSet Source
RUN echo "deb http://mirrors.163.com/ubuntu/dists/ trusty main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/dists/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/dists/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/dists/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/dists/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/dists/ trusty main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/dists/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/dists/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/dists/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/dists/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive
ENV VLCVERSION 2.1.6-0ubuntu14.04.1
ENV uid 1000
ENV gid 1000

RUN useradd -m vlc; \
    apt-get update; \
    apt-get install -y vlc=$VLCVERSION; \
    rm -rf /var/lib/apt/lists/*

COPY start-vlc.sh /tmp/

ENTRYPOINT ["/tmp/start-vlc.sh"]
