# Maestro de Jenkins - Contenedor Docker
Proyecto con Dockerfiles para generar una imagen Docker con Jenkins desde 0, utilizando una imagen CentOS 7 como base.

A partir de esta imagen CentOS 7 se crea una imagen con JDK 1.8 instalado como intermediaria, sobre la cual se instala un Tomcat 8 que inicializa lo que encuentre en su directorio "webapps". 

Por último, sobre ésta imagen se baja un paquete WAR de la página oficial de Jenkins con la versión correspondiente, definiendo las distintas variables de entorno necesarias.


# Método de instalación

Requisitos previos:
- Docker instalado
- Make instalado

Para construir las distintas imágenes tendremos que modificar el '*makefile*' a gusto y, tras ello, iniciarlo con las distintas opciones para construir una a una las imágenes, o simplemente lanzar el proceso general de instalación y que lo haga por orden y de manera automática:

*- make build-jdk
- make build-tomcat
- make build-jenkins
- make build-all*
