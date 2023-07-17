#!/bin/bash
az servicebus namespace create \
  --name msjad-servicebus \
  --resource-group MSAJDGroup \
  --location westeurope \
  --sku Standard \
  --zone-redundant false \
  --mi-system-assigned true

az servicebus queue create \
  --name msjad-email-queue \
  --namespace-name msjad-servicebus \
  --resource-group MSAJDGroup \
  --max-delivery-count 3

az servicebus queue create \
  --name msjad-reserve-queue \
  --namespace-name msjad-servicebus \
  --resource-group MSAJDGroup \
  --max-delivery-count 3 \
  --default-message-time-to-live P7D \
  --forward-dead-lettered-messages-to msjad-email-queue
