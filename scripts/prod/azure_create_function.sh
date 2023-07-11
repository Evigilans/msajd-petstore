#!/bin/bash
az storage account create \
  --name msajdsa \
  --resource-group MSAJDGroup \
  --location westeurope \
  --sku Standard_LRS \
  --kind StorageV2 \
  --access-tier Cool

sleep 30s

az storage container create \
  --name msajdsa-blob \
  --account-name msajdsa \
  --public-access blob

sleep 30s

az functionapp create \
  --name msajd-order-reserver \
  --resource-group MSAJDGroup \
  --storage-account msajdsa \
  --consumption-plan-location westeurope \
  --functions-version 4 \
  --deployment-source-url "https://github.com/Evigilans/petstoreorderreserver" \
  --os-type Linux \
  --runtime "java" \
  --runtime-version "17.0"

sleep 30s

az functionapp deployment github-actions add \
  --name msajd-order-reserver \
  --resource-group MSAJDGroup \
  --repo "https://github.com/Evigilans/petstoreorderreserver" \
  --runtime "java" \
  --runtime-version "17.0"
