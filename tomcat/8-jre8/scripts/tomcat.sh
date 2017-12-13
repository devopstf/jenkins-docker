#!/bin/bash

# Checks if the admin user has been created
if [ ! -f ${CATALINA_HOME}/scripts/.tomcat_admin_created ]; then
        ${CATALINA_HOME}/scripts/create_admin_user.sh
fi

# Execs initialization scripts that comes with Tomcat package
exec catalina.sh run
