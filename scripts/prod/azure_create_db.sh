#!/bin/bash
az postgres flexible-server create \
  --resource-group MSAJDGroup \
  --name msajd-petstore \
  --location westeurope \
  --admin-user msajd \
  --admin-password paSSw0rd \
  --sku-name Standard_B1ms \
  --tier Burstable \
  --storage-size 32 \
  --version 14 \
  --yes

sleep 30s

az postgres flexible-server db create \
  --database-name petstore \
  --resource-group MSAJDGroup \
  --server-name msajd-petstore

az cosmosdb create \
  --name msajd-cosmosdb \
  --resource-group MSAJDGroup \
  --locations regionName=westeurope failoverPriority=0 isZoneRedundant=False \
  --default-consistency-level BoundedStaleness \
  --enable-free-tier true

sleep 15s

az cosmosdb sql database create \
  --account-name msajd-cosmosdb \
  --name petstoreorderservice_db \
  --resource-group MSAJDGroup

sleep 15s

az cosmosdb sql container create \
  --account-name msajd-cosmosdb \
  --database-name petstoreorderservice_db \
  --name order \
  --partition-key-path "/id" \
  --resource-group MSAJDGroup
