#!/bin/bash
VAULT_NAME="msajdkv"

az keyvault create \
  --resource-group MSAJDGroup \
  --name $VAULT_NAME \
  --location westeurope

secrets=(
  "orderServiceUrl:msajd-petstoreorderservice.azurewebsites.net/"
  "petServiceUrl:msajd-petstorepetservice.azurewebsites.net/"
  "productServiceUrl:msajd-petstoreproductservice.azurewebsites.net/"
  "orderReserverServiceUrl:msajd-order-reserver.azurewebsites.net"
  "dbPetServiceUrl:jdbc:postgresql://msajd-petstore.postgres.database.azure.com:5432/petstore?currentSchema=petstorepetservice_db"
  "dbProductServiceUrl:jdbc:postgresql://msajd-petstore.postgres.database.azure.com:5432/petstore?currentSchema=petstoreproductservice_db"
  "dbUser:msajd"
  "dbPassword:paSSw0rd"
  "dbOrderServiceUrl:https://msajd-cosmosdb.documents.azure.com:443/"
  "dbOrderServiceToken:kWj7iIl4hT19xwrNouVKAxoSqVwjKO8NEKkoEooMWqDFVRp6u2BYNpzMH1ch2j7HIfG76z00qICwACDbkfU94w=="
)

for secret in "${secrets[@]}"; do
  IFS=":" read -r secret_name secret_value <<<"$secret"
  az keyvault secret set --vault-name "$VAULT_NAME" --name "$secret_name" --value "$secret_value" --output none
done
