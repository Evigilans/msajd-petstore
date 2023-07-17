#!/bin/bash
#sleep 30s

#az functionapp plan create \
#  --name msajd-order-reserver-plan \
#  --resource-group MSAJDGroup \
#  --sku B1 \
#  --is-linux true \
#  --location westeurope
#
#az functionapp create \
#  --name msajd-order-reserver \
#  --resource-group MSAJDGroup \
#  --plan msajd-order-reserver-plan \
#  --storage-account msajdsa \
#  --functions-version 4 \
#  --os-type Linux \
#  --runtime "java" \
#  --runtime-version "17.0"
#
#az functionapp config container set \
#  --name msajd-order-reserver \
#  --resource-group MSAJDGroup \
#  --max-replicas 1 \
#  --image msajdregistry.azurecr.io/petstoreorderreserver:2.0.0 \
#  --registry-username $(az acr credential show --name msajdregistry --query username --output tsv) \
#  --registry-password $(az acr credential show --name msajdregistry --query passwords[0].value --output tsv)
