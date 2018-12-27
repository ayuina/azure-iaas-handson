#!/bin/bash

VNET_NAME="${PREFIX}-vnet"
SUBNET_NAME="default"

az network vnet create \
    --resource-group $MOD01_RG \
    --location $REGION \
    --name $VNET_NAME \
    --address-prefixes "10.12.26.0/24" \
    --subnet-name $SUBNET_NAME \
    --subnet-prefixes "10.12.26.0/26" \
    --output table

