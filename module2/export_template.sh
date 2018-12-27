#!/bin/bash

az group export \
    --resource-group $MOD01_RG \
    --include-parameter-default-value \
    > "${MOD01_RG}-exported-template.json"

