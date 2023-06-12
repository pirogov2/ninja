#!/bin/bash

read -p "Enter the master domain: " masterDomain
read -p "Enter the child domain: " childDomain
read -p "Enter the owner: " owner

# Replace PHP version if desired
phpVersion="8.0"

# Construct the command
command="cyberpanel createChild --masterDomain $masterDomain --childDomain $childDomain --owner $owner --php $phpVersion"

# Execute the command
echo "Creating child domain..."
eval $command

echo "Child domain created successfully."
