# Jenkins Master - Docker Container
Dockerfile project to generate your own Jenkins-master docker image from scratch, over a CentOS 7 image.

Using this CentOS 7 as its base, with this project you'll generate a reusable JDK 1.8 image, which will be used to generate a Tomcat 8 one, that start up looking at '*webapps*' folder to deploy the package it founds there.

Then, the last Dockerfile will download the WAR package from the official Jenkins webpage with the configured version.


# Pre-requisites

Pre-requisites to build:
- [Docker](https://docs.docker.com/engine/installation/) installed (of course).

Optional:
- [Make](https://www.gnu.org/software/make/) installed (for easier building).

# Building manually
Just use '*docker build .*' inside each folder...

# Building using the makefile
To automatize this process, you can use the *makefile* located in this project. It's already configured to use the project defined tree and deploy each image one by one. You can even decide to build them one at a time or just go with the generic build all process and let make do the magic for you.

Here are the defined processes:
- *make build-jdk*
- *make build-tomcat*
- *make build-jenkins*
- *make build-all*
