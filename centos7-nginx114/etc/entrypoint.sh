#!/bin/bash

# Ensure that assigned uid has an entry in /etc/passwd.
# See https://docs.openshift.com/container-platform/3.7/creating_images/guidelines.html
USER=osuser
if ! whoami &> /dev/null; then
    echo "${USER}:x:$(id -u):0:,,,:/home/${USER}:/bin/bash" >> /etc/passwd
    mkdir -p /home/${USER}
    export HOME="/home/${USER}"
fi

nginx