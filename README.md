# Jenkins Master - sobre Tomcat 8
Proyecto con Dockerfiles para generar una imagen Docker con Jenkins desde 0, utilizando una imagen CentOS 7 como base.

A partir de esta imagen CentOS 7 se crea una imagen con JDK 1.8 instalado como intermediaria, sobre la cual se instala un Tomcat 8 que inicializa lo que encuentre en su directorio "webapps". 

Por último, sobre ésta imagen se baja un paquete WAR de la página oficial de Jenkins con la versión correspondiente, definiendo las distintas variables de entorno necesarias.
