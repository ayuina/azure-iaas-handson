#!/bin/bash

VNET_NAME="${PREFIX}-vnet"
SUBNET_NAME="vmfarm"

az network vnet subnet create \
    --resource-group $MOD01_RG \
    --vnet-name $VNET_NAME \
    --name $SUBNET_NAME \
    --address-prefixes "10.12.26.64/26" \
    --output table

