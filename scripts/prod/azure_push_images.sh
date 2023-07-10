#!/bin/bash
az acr login --name msajdregistry

docker push msajdregistry.azurecr.io/petstoreapp:2.0.0

# docker push msajdregistry.azurecr.io/petstoreorderservice:2.0.0
#
# docker push msajdregistry.azurecr.io/petstorepetservice:2.0.0
#
# docker push msajdregistry.azurecr.io/petstoreproductservice:2.0.0

sleep 30s

az acr update -n msajdregistry --admin-enabled true
