PHONY: help
.DEFAULT_GOAL := help

## Select the label used to build the images
LABEL=odiadom/

## Set up images version
JDK_VERSION_MAYOR=1.8
JDK_VERSION_FULL=1.8.0_151
TOMCAT_VERSION_MAYOR=8-jre8
TOMCAT_VERSION_FULL=8.5.24
JENKINS_VERSION=2.90

## Set up Jenkins HTTP, JNLP port & persistence directory
HOST_PORT=80
HOST_JNLP_PORT=48888
HOST_JENKINS_PERSISTENCE=/opt/jenkins_home

build-jdk: ## Build JDK docker image
	@echo "Building JDK ${JDK_VERSION_MAYOR} docker image...";
	@echo "Full version is << ${JDK_VERSION_FULL} >>";
	@echo "=========================================================";
	@cd jdk/${JDK_VERSION_MAYOR}; docker build -t ${LABEL}/jdk:${JDK_VERSION_FULL} .;

build-tomcat: ## Build TOMCAT docker image
	@echo "Building TOMCAT ${TOMCAT_VERSION_MAYOR} docker image...";
	@echo "Full version is << ${TOMCAT_VERSION_FULL} >>"
	@echo "=========================================================";
	@cd tomcat/${TOMCAT_VERSION_MAYOR}; docker build -t ${LABEL}/tomcat:${TOMCAT_VERSION_FULL} .;

build-jenkins: ## Build JENKINS MASTER docker image
	@echo "Building JENKINS MASTER ${JENKINS_VERSION} docker image...";
	@echo "=========================================================";
	@cd jenkins-master/${JENKINS_VERSION}; docker build -t ${LABEL}/jenkins:${JENKINS_VERSION} .;
	
build-all: ## Build all the images at once
	@echo "Called general building process...";
	@echo "The setup is:";
	@echo "Java Development Kit version: ${JDK_VERSION_FULL}";
	@echo "Tomcat version: ${TOMCAT_VERSION_FULL}";
	@echo "Jenkins Master WAR version: ${JENKINS_VERSION}";
	@echo "=========================================================";
	@make build-jdk; make build-tomcat; make build-jenkins;
	
run: ## Run the Jenkins master container
	@echo "Running Jenkins Master with default options";
	@docker run -p ${HOST_PORT}:8080 -p ${HOST_JNLP_PORT}:48888 -v ${HOST_JENKINS_PERSISTENCE}:/var/jenkins ${LABEL}/jenkins:${JENKINS_VERSION}

debug: ## Enter Jenkins Master container terminal to do some debugging
	@docker run -ti -p ${HOST_PORT}:8080 -p ${HOST_JNLP_PORT}:48888 -v ${HOST_JENKINS_PERSISTENCE}:/var/jenkins ${LABEL}/jenkins:${JENKINS_VERSION} bash
	
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

