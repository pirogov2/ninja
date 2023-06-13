#!/bin/bash

# Function to generate random alphanumeric name
generate_random_name() {
  random_name=$(tr -dc 'a-zA-Z0-9' < /dev/urandom | fold -w 8 | head -n 1)
  echo "${random_name}"
}

# Get domain name from user input
read -p "Enter the domain name: " DOMAIN_NAME

# Generate a random name for the zip file
RANDOM_NAME=$(generate_random_name)

# Path to the zip file on your local machine
LOCAL_ZIP_FILE="/path/to/your-zip-file.zip"

# Destination path on the server
SERVER_PUBLIC_HTML="/home/${DOMAIN_NAME}/public_html"

# URL to access the installed files
URL="https://${DOMAIN_NAME}/${RANDOM_NAME}/install"

# Upload the zip file to the server with a random name
upload_zip_file() {
  cp "$LOCAL_ZIP_FILE" "${SERVER_PUBLIC_HTML}/${RANDOM_NAME}.zip"

  if [[ $? -eq 0 ]]; then
    echo "Zip file uploaded successfully with name: ${RANDOM_NAME}.zip"
  else
    echo "Error uploading zip file."
    exit 1
  fi
}

# Extract the zip file and remove it
extract_and_cleanup() {
  cd "$SERVER_PUBLIC_HTML"
  unzip -q "${RANDOM_NAME}.zip" -d "${RANDOM_NAME}"
  rm "${RANDOM_NAME}.zip"
  echo "Extraction complete. Zip file deleted."
}

# Execute the upload_zip_file function
upload_zip_file

# Execute the extract_and_cleanup function
extract_and_cleanup

# Remove "public_html" from the URL
URL_WITHOUT_PUBLIC_HTML=$(echo "$URL" | sed 's#/public_html/#/#')

echo "Access the installed files using the following URL: ${URL_WITHOUT_PUBLIC_HTML}"
