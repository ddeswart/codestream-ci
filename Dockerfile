FROM centos:centos7
LABEL maintainer="ddeswart@vmware.com"

RUN yum update -y && yum -y install \
        curl \
        wget \
        unzip \
        git
ADD VERSION .
