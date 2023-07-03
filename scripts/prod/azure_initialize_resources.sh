#!/bin/bash
function createPlan() {
  APP_NAME=$1
  LOCATION=$2
  SKU_TYPE=$3

  echo "Creating a plan for $APP_NAME in $LOCATION region..."
  az appservice plan create \
    --name msajd-$APP_NAME-$LOCATION-plan \
    --resource-group MSAJDGroup \
    --is-linux \
    --sku $SKU_TYPE \
    --location $LOCATION \
    --output none
}

resourceGroup="MSAJDGroup"
az group show --name $resourceGroup --output none
if [ $? -eq 0 ]; then
  echo "Resource group already exists."
else
  echo "Resource group does not exist. Creating new."
  az group create \
    --name $resourceGroup \
    --location westeurope \
    --output none
fi

az acr show --name msajdregistry --resource-group $resourceGroup --output none
if [ $? -eq 0 ]; then
  echo "Container registry already exists."
else
  echo "Container registry does not exist. Creating new."
  az acr create \
    --name msajdregistry \
    --resource-group $resourceGroup \
    --location westeurope \
    --sku Basic \
    --output none
fi

echo "Creating traffic-manager..."
az network traffic-manager profile create \
  --name msajd-petstoreapp-tm \
  --resource-group MSAJDGroup \
  --routing-method Priority \
  --unique-dns-name msajd-tm-dns \
  --ttl 30 \
  --output none

echo "Creating plans..."
createPlan petstoreapp westeurope S1
createPlan petstoreapp northeurope S1
createPlan petstorepetservice westeurope S1
createPlan petstoreorderservice westeurope S1
createPlan petstoreproductservice westeurope S1
