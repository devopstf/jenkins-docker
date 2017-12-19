FROM centos:centos7

LABEL creator="odiadom - Óscar Díaz Domínguez"
LABEL maintainer="DevOpsTF - DevOps Tenerife"

# Variables to define JDK setup
ARG JDK_ZIP_NAME=jdk-8u151-linux-x64.tar.gz
ARG JAVA_VERSION=1.8
ARG JDK_VERSION=jdk1.8.0_151

# Set up JAVA_HOME to 
ENV JAVA_HOME /opt/${JDK_VERSION}

# Install 'wget' to download JDK
RUN yum install -y wget

# Download JDK 1.8
RUN wget --no-cookies --no-check-certificate \
         --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
         "http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz"

# Decompress the package 
RUN tar xfz ${JDK_ZIP_NAME} -C /opt && \
    echo "JAVA_HOME=/opt/${JDK_VERSION}" >> /etc/environment

# Define working directory
WORKDIR /opt/${JDK_VERSION}
