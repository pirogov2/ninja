#!/bin/bash

read -p "Enter the domain name: " domain

# Install SSL on hostname
command1="cyberpanel hostNameSSL --domainName $domain"

# Install SSL on mail server
command2="cyberpanel mailServerSSL --domainName $domain"

# Execute the commands
echo "Installing SSL on the hostname..."
eval $command1

echo "Installing SSL on the mail server..."
eval $command2

echo "SSL installation on the hostname and mail server completed."
