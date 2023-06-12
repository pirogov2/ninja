#!/bin/bash

# Function to install WordPress on a website
function install_wordpress() {
    local domain="$1"
    local email="$2"
    local username="$3"
    local password="$4"
    local site_title="$5"

    # Install WordPress using CyberPanel CLI
    cyberpanel installWordPress --domainName="$domain" --email="$email" --userName="$username" --password="$password" --siteTitle="$site_title"
}

# Parse command-line arguments
function parse_arguments() {
    case "$1" in
        install-wordpress)
            install_wordpress "$2" "$3" "$4" "$5" "$6"
            ;;
        *)
            echo "Invalid function. Usage: cyberpanel [function]"
            exit 1
            ;;
    esac
}

# Main script

# Check if CyberPanel CLI is installed
if ! command -v cyberpanel &> /dev/null; then
    echo "CyberPanel CLI is not installed. Please install it before running this script."
    exit 1
fi

# Check if arguments are provided
if [ "$#" -lt 1 ]; then
    echo "Function is not provided. Usage: cyberpanel [function]"
    exit 1
fi

# Parse command-line arguments
parse_arguments "$@"
