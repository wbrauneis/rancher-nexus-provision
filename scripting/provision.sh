#!/bin/bash

# A simple example script that publishes a number of scripts to the Nexus Repository Manager
# and executes them.

# fail if anything errors
set -e
# fail if a function call is missing an argument
set -u

# inital nexus admin credentials
username=admin
password=admin123

# add the context if you are not using the root context
host=${NEXUS_URL}

# add a script to the repository manager and run it
function addAndRunScript {
  name=$1
  file=$2
  java -jar /root/scripting/nexus-addscript.jar -u "$username" -p "$password" -n "$name" -f "$file" -h "$host"
  
  printf "\nPublished $file as $name\n\n"
  curl -v -X POST -u $username:$password --header "Content-Type: text/plain" "$host/service/siesta/rest/v1/script/$name/run"
  printf "\nSuccessfully executed $name script\n\n\n"
}

printf "Provisioning Integration API Scripts starting \n\n" 
printf "Publishing and executing on $host\n"

addAndRunScript config /usr/share/nexus/nexus-confd/config.groovy

printf "\nProvisioning Scripts Completed\n\n"
