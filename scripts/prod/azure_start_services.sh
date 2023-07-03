#!/bin/bash
function runService() {
  APP_NAME=$1
  LOCATION=$2
  MAX_INSTANCES=$3

  echo "Preparing to start $APP_NAME"

  echo "Starting a webapp..."
  az webapp create \
    --resource-group MSAJDGroup \
    --name msajd-$APP_NAME \
    --plan msajd-$APP_NAME-$LOCATION-plan \
    --deployment-container-image-name msajdregistry.azurecr.io/$APP_NAME:2.0.0 \
    --docker-registry-server-user $(az acr credential show --name msajdregistry --query username --output tsv) \
    --docker-registry-server-password $(az acr credential show --name msajdregistry --query passwords[0].value --output tsv)

  echo "Applying settings..."
  az webapp config appsettings set \
    -g MSAJDGroup \
    -n msajd-$APP_NAME \
    --settings WEBSITES_PORT=8080 \
    PETSTOREORDERSERVICE_URL=msajd-petstoreorderservice.azurewebsites.net \
    PETSTOREPETSERVICE_URL=msajd-petstorepetservice.azurewebsites.net \
    PETSTOREPRODUCTSERVICE_URL=msajd-petstoreproductservice.azurewebsites.net

  echo "Creating monitor..."
  az monitor autoscale create \
    --resource-group MSAJDGroup \
    --name msajd-$APP_NAME-autoscale \
    --resource msajd-$APP_NAME-$LOCATION-plan \
    --resource-type Microsoft.Web/serverfarms \
    --location westeurope \
    --count 1 \
    --min-count 1 \
    --max-count $MAX_INSTANCES

  echo "Creating rules..."
  az monitor autoscale rule create \
    --resource-group MSAJDGroup \
    --autoscale-name msajd-$APP_NAME-autoscale \
    --scale out $MAX_INSTANCES \
    --scale in 1 \
    --condition "CpuPercentage > 75 avg 1m"
}

runService petstorepetservice westeurope 2
runService petstoreorderservice westeurope 2
runService petstoreproductservice westeurope 2
