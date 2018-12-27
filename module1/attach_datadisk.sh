#!/bin/bash

VNET_NAME="${PREFIX}-vnet"
JUMPBOX_VM_NAME="${PREFIX}-jb"
DATA_DISK_NAME="${PREFIX}-jb-datadisk00"

echo "shutting down virtual machine..."
az vm deallocate \
    --resource-group $MOD01_RG \
    --name $JUMPBOX_VM_NAME

echo "attaching data disk to virtual machine ..."
az vm disk attach \
    --resource-group $MOD01_RG \
    --disk $DATA_DISK_NAME \
    --vm-name $JUMPBOX_VM_NAME \
    --size-gb 255 \
    --sku Premium_LRS \
    --new

echo "restarting virtual machine ..."
az vm start \
    --resource-group $MOD01_RG \
    --name $JUMPBOX_VM_NAME
