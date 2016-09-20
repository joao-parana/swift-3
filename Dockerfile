FROM ubuntu:14.04

MAINTAINER "João Antonio Ferreira" <joao.parana@gmail.com>

ENV REFRESHED_AT 2016-09-20

LABEL Description="Linux Ubuntu 14.04 image with the Swift binaries."

# Dockerfile to build a Docker image with the Swift binaries and its dependencies.
# See this image https://github.com/docker-brasil/swift-2_2 

# Set environment variables for image
ENV SWIFT_SNAPSHOT swift-3.0-RELEASE
ENV SWIFT_SNAPSHOT_LOWERCASE swift-3.0-release
ENV UBUNTU_VERSION ubuntu14.04
ENV UBUNTU_VERSION_NO_DOTS ubuntu1404
ENV HOME /root
ENV WORK_DIR /root

# Set WORKDIR
WORKDIR ${WORK_DIR}

# Linux OS utils
RUN apt-get update && apt-get install -y \
  automake \
  build-essential \
  clang \
  curl \
  gcc-4.8 \
  git \
  g++-4.8 \
  libbsd-dev \
  libglib2.0-dev \
  libpython2.7 \
  libicu-dev \
  libtool \
  lsb-core \
  openssh-client \
  vim \
  wget \
  libcurl4-openssl-dev \
  openssl \
  libssl-dev \
  uuid-dev

ADD .vim /root/.vim
ADD .vimrc /root/.vimrc

RUN echo "set -o vi" >> /root/.bashrc

# Install Swift compiler
RUN wget https://swift.org/builds/$SWIFT_SNAPSHOT_LOWERCASE/$UBUNTU_VERSION_NO_DOTS/$SWIFT_SNAPSHOT/$SWIFT_SNAPSHOT-$UBUNTU_VERSION.tar.gz \
  && tar xzvf $SWIFT_SNAPSHOT-$UBUNTU_VERSION.tar.gz \
  && rm $SWIFT_SNAPSHOT-$UBUNTU_VERSION.tar.gz
ENV PATH $WORK_DIR/$SWIFT_SNAPSHOT-$UBUNTU_VERSION/usr/bin:$PATH
RUN swiftc -h

