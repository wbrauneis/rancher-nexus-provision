#!/bin/bash

until $(curl --output /dev/null --silent --head --fail ${NEXUS_URL}); do
    printf '.'
    sleep 5
done

while [ ! -f /usr/share/nexus/nexus-confd/config.groovy ]; do
    printf ':'
    sleep 3
done

printf '\n Provision configuration script'
/root/scripting/provision.sh