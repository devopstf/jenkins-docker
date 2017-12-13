FROM centos:centos7

# Variables para uso del Dockerfile
ARG JDK_ZIP_NAME=jdk-8u151-linux-x64.tar.gz
ARG JAVA_VERSION=1.8
ARG JDK_VERSION=jdk1.8.0_151

# Variable de entorno para definir el JAVA_HOME para usos posteriores
ENV JAVA_HOME /opt/${JDK_VERSION}

# Se instalan las distintas utilidades así como Docker-CE (última versión)
RUN yum install -y wget yum-utils device-mapper-persistent-data lvm2 && \
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    yum install -y docker-ce

# Se descarga el JDK 1.8 para distribuciones Linux
RUN wget --no-cookies --no-check-certificate \
         --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
         "http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz"

# Se descomprime el fichero jar del JDK anterior
RUN tar xfz ${JDK_ZIP_NAME} -C /opt && \
    echo "JAVA_HOME=/opt/${JDK_VERSION}" >> /etc/environment

# Se define el directorio de trabajo
WORKDIR /opt/${JDK_VERSION}
