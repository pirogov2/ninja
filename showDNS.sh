#!/bin/bash

read -p "Enter the domain name: " domain

# List DNS records for the domain, filter by TXT records, and exclude records containing "mail"
command="cyberpanel listDNSPretty --domainName $domain | grep TXT | grep -v mail"

# Execute the command and output the results
echo "DNS records for $domain (TXT only, excluding records containing 'mail'):"
eval $command
