FROM centos:centos7
LABEL maintainer="ddeswart@vmware.com"

WORKDIR /tmp

RUN yum update -y && yum -y install \
    curl \
    wget \
    sshpass \
    unzip \
    git \
    nano \
    python

#Cleanup image tmp dir
RUN rm -rf /tmp/*

ADD VERSION .
