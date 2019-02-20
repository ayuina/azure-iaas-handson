#!/bin/bash

SUBSCRIPTION_ID=$(az account show --query id | sed -e 's/\"//g')
VNET_NAME="${PREFIX}-vnet"
SUBNET_NAME="vmfarm"
SUBNET_ID="/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${MOD01_RG}/providers/Microsoft.Network/virtualNetworks/${VNET_NAME}/subnets/${SUBNET_NAME}"

az group deployment create \
    --resource-group $MOD02_RG \
    --template-file "vmfarm_template.json" \
    --parameters prefix="${PREFIX}" location="${REGION}" subnetId="${SUBNET_ID}" vmCount=4\
    --name "vmfarm_template_deployment_$(date '+%s')" \
    --output table

