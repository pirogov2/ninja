#!/bin/bash

read -p "Enter the website domain: " websiteDomain
read -p "Enter the database name: " dbName
read -p "Enter the database username: " dbUsername
read -p "Enter the database password: " dbPassword

# Construct the command
command="cyberpanel createDatabase --databaseWebsite $websiteDomain --dbName $dbName --dbUsername $dbUsername --dbPassword $dbPassword"

# Execute the command
echo "Creating database..."
eval $command

echo "Database created successfully."
