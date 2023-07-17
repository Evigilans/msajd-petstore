#!/bin/bash
function buildModule() {
  MODULE_NAME=$1
  echo "Building $MODULE_NAME"

  echo "Building images..."
  mvn -f $MODULE_NAME/pom.xml dockerfile:build
  echo "Done!"
  sleep 5s
}

cd ..
buildModule petstoreapp
#buildModule petstoreorderservice
#buildModule petstorepetservice
#buildModule petstoreproductservice
#
#cd petstoreorderreserver
#docker build -t msajdregistry.azurecr.io/petstoreorderreserver:2.0.0 .
