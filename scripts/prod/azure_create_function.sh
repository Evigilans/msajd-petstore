#!/bin/bash
az storage account create \
  --name msajdsa \
  --resource-group MSAJDGroup \
  --location westeurope \
  --sku Standard_LRS \
  --kind BlobStorage

az functionapp create \
  --name msajd-order-reserver \
  --resource-group MSAJDGroup \
  --storage-account msajdsa \
  --deployment-source-url "https://github.com/Evigilans/petstoreorderreserver"
