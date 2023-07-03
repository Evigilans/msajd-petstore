#!/bin/bash
function runWebApp() {
  LOCATION=$1
  ENDPOINT_PRIORITY=$2

  echo "Preparing to start petstoreapp in $LOCATION region"

  echo "Starting a webapp..."
  az webapp create \
    --resource-group MSAJDGroup \
    --name msajd-petstoreapp-$LOCATION \
    --plan msajd-petstoreapp-$LOCATION-plan \
    --deployment-container-image-name msajdregistry.azurecr.io/petstoreapp:2.0.0 \
    --docker-registry-server-user $(az acr credential show --name msajdregistry --query username --output tsv) \
    --docker-registry-server-password $(az acr credential show --name msajdregistry --query passwords[0].value --output tsv) \
    --output none

  echo "Applying settings..."
  az webapp config appsettings set \
    -g MSAJDGroup \
    -n msajd-petstoreapp-$LOCATION \
    --settings WEBSITES_PORT=8080 \
    PETSTOREORDERSERVICE_URL=msajd-petstoreorderservice.azurewebsites.net \
    PETSTOREPETSERVICE_URL=msajd-petstorepetservice.azurewebsites.net \
    PETSTOREPRODUCTSERVICE_URL=msajd-petstoreproductservice.azurewebsites.net \
    --output none

  az network traffic-manager endpoint create \
    --name msajd-petstoreapp-$LOCATION-tm \
    --profile-name msajd-petstoreapp-tm \
    --resource-group MSAJDGroup \
    --target-resource-id /subscriptions/811b4f24-cd38-4144-b2a0-74d22eceb65e/resourceGroups/MSAJDGroup/providers/Microsoft.Web/sites/msajd-petstoreapp-$LOCATION \
    --type azureEndpoints \
    --priority $ENDPOINT_PRIORITY \
    --weight 50

  echo "Done for $LOCATION region!"
}

echo "Creating traffic-manager..."
az network traffic-manager profile create \
  --name msajd-petstoreapp-tm \
  --resource-group MSAJDGroup \
  --routing-method Priority \
  --unique-dns-name msajd-tm-dns \
  --ttl 30 \
  --output none

runWebApp westeurope 1
runWebApp northeurope 2
