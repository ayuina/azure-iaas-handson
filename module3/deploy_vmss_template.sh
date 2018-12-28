#!/bin/bash

SUBSCRIPTION_ID=$(az account show --query id | sed -e 's/\"//g')
VNET_NAME="${PREFIX}-vnet"
SUBNET_NAME="vmss"
SUBNET_ID="/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${MOD01_RG}/providers/Microsoft.Network/virtualNetworks/${VNET_NAME}/subnets/${SUBNET_NAME}"

az group deployment create \
    --resource-group $MOD03_RG \
    --template-file "vmss_template.json" \
    --parameters prefix="${PREFIX}" location="${REGION}" subnetId="${SUBNET_ID}" \
    --name "vmss_template_deployment_$(date '+%s')" \
    --output table

