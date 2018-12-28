#!/bin/bash

az group delete --resource-group $MOD03_RG --yes --no-wait
az group delete --resource-group $MOD02_RG --yes --no-wait
az group delete --resource-group $MOD01_RG --yes --no-wait


