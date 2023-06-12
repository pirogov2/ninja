#!/bin/bash

# Function to display script usage
display_usage() {
    echo "Usage: $0"
}

# Ask user for domain name
read -p "Enter the domain name: " domain

# Ask user for email address
read -p "Enter the email address: " email

# Set optional arguments (change values to 1 to enable features, 0 to disable them)
ssl=1
dkim=1
open_basedir=1

# Set PHP version
php_version=8.0

# Create the website using CyberPanel CLI
cyberpanel createWebsite --package Default --owner admin --domainName "$domain" --email "$email" --php "$php_version" \
    --ssl "$ssl" --dkim "$dkim" --openBasedir "$open_basedir"

# Check the exit status of the command
if [ $? -eq 0 ]; then
    echo "Website creation successful!"
else
    echo "Website creation failed."
fi
