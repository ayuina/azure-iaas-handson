#!/bin/bash

VNET_NAME="${PREFIX}-vnet"
SUBNET_NAME="default"
JUMPBOX_VM_NAME="${PREFIX}-jb"

az vm create \
    --resource-group $MOD01_RG \
    --location $REGION \
    --name $JUMPBOX_VM_NAME \
    --image "UbuntuLTS" \
    --size Standard_D2s_v3 \
    --vnet-name $VNET_NAME \
    --subnet $SUBNET_NAME \
    --generate-ssh-keys
