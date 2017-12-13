FROM odiadom/jdk:1.8.0_151

# Variables de versión
ARG TOMCAT_MAJOR=8
ARG TOMCAT_VERSION=8.5.24

# Variables de entorno para la máquina
ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts

# Variable de URL de descarga, que varía se´gun la versión de TOMCAT a descargarse
ARG DOWNLOAD_URL=http://apache.osuosl.org/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Se descarga el .tar.gz
RUN wget ${DOWNLOAD_URL}

# Se descomprime y se mueve el resultado al HOME de CATALINA definido anteriormente como variable de entorno
RUN tar -xvf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    rm -rf apache-tomcat*.tar.gz && \
    mv apache-tomcat* ${CATALINA_HOME}

# Ajuste de permisos para los binarios
RUN chmod +x ${CATALINA_HOME}/bin/*sh

# Añadimos los scripts para ejecuciones del contenedor
ADD scripts/create_admin_user.sh $CATALINA_HOME/scripts/create_admin_user.sh
ADD scripts/tomcat.sh $CATALINA_HOME/scripts/tomcat.sh
RUN chmod +x $CATALINA_HOME/scripts/*.sh

# Se crea el usuario para Tomcat en la máquina
RUN groupadd -r tomcat && \
    useradd -g tomcat -d ${CATALINA_HOME} -s /sbin/nologin  -c "Tomcat user" tomcat && \
    chown -R tomcat:tomcat ${CATALINA_HOME}

# Directorio de trabajo por defecto
WORKDIR /opt/tomcat

# Puertos a exponer para Tomcat
EXPOSE 8080
EXPOSE 8009

USER tomcat
CMD ["tomcat.sh"]
