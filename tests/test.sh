#!/bin/bash

# Get Packages
./sbpl.sh

# Include Packages
export PATH="$(./sbpl.sh envvars sbpl_path_bin):$PATH"


### Run Test

# Check if Terraform is present
if ! [ -x "$(command -v terraform 2>/dev/null)" ]; then
    echo 'error: terraform not found in $PATH.'
    exit 2
fi

# Init Terraform
if ! terraform init -input=false > /dev/null; then
    echo "failed to init terraform" 
    exit 1
fi

# Check if value is queried correctly
if terraform apply -auto-approve | grep "os_type = unix" > /dev/null; then
    echo 'success'
else
    echo "fail"
    exit 1
fi

### Run Wine
if command -v wine; then
    wine cmd /c test.bat
fi

