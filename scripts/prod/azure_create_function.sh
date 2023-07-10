#!/bin/bash
az storage account create \
  --name msajdsa \
  --resource-group MSAJDGroup \
  --location westeurope \
  --sku Standard_LRS \
  --tier Standard \
  --kind StorageV2
