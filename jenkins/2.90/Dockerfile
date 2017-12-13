FROM odiadom/tomcat-jdk1.8:8.5.24

LABEL creator="odiadom - Óscar Díaz Domínguez"
LABEL maintainer="DevOpsTF - DevOps Tenerife"

# Variables to define Jenkins version and Jenkins Home directory
ARG JENKINS_VERSION=2.90
ARG JENKINS_HOME=/var/jenkins

# Set up the environment variables to be used by the container
ENV JENKINS_VERSION ${JENKINS_VERSION}
ENV JENKINS_HOME ${JENKINS_HOME}

# Set up download URL and WAR folder
ARG JENKINS_URL=https://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/${JENKINS_VERSION}/jenkins-war-${JENKINS_VERSION}.war
ARG JENKINS_WAR_FOLDER=/opt/tomcat/webapps

USER root

# Downloads the Jenkins WAR and leaves it in tomcat folder
RUN curl -fsSL ${JENKINS_URL} -o ${JENKINS_WAR_FOLDER}/jenkins.war && \
    yum install -y git

# JNLP default port
EXPOSE 48888
