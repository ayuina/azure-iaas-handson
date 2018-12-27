#!/bin/bash

az group export --resource-group $MOD01_RG > "${PREFIX}-template.json"

