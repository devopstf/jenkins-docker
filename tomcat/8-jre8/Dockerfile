FROM odiadom/jdk:1.8.0_151

LABEL creator="odiadom - Óscar Díaz Domínguez"
LABEL maintainer="DevOpsTF - DevOps Tenerife"

# Tomcat version variables
ARG TOMCAT_MAJOR=8
ARG TOMCAT_VERSION=8.5.24

# Set up environment variables and Path.
ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts

# Set up download URL, which varies depending on earlier defined variables in this Dockerfile
ARG DOWNLOAD_URL=http://apache.osuosl.org/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Downloads the package
RUN wget ${DOWNLOAD_URL}

# Decompress and move result in to earlier defined 'CATALINA_HOME'
RUN tar -xvf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    rm -rf apache-tomcat*.tar.gz && \
    mv apache-tomcat* ${CATALINA_HOME}

# Adjust binary permission
RUN chmod +x ${CATALINA_HOME}/bin/*sh

# Add some initialization scripts to keep the container running
ADD scripts/create_admin_user.sh $CATALINA_HOME/scripts/create_admin_user.sh
ADD scripts/tomcat.sh $CATALINA_HOME/scripts/tomcat.sh
RUN chmod +x $CATALINA_HOME/scripts/*.sh

# Creates tomcat user as well as its group; also sets up permission on CATALINA_HOME
RUN groupadd -r tomcat && \
    useradd -g tomcat -d ${CATALINA_HOME} -s /sbin/nologin  -c "Tomcat user" tomcat && \
    chown -R tomcat:tomcat ${CATALINA_HOME}

# Default working directory for Tomcat
WORKDIR /opt/tomcat

# Expose this ports to the host!
EXPOSE 8080
EXPOSE 8009

USER tomcat
CMD ["tomcat.sh"]
