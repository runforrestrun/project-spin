#!/bin/bash

# Continuous Hitting Script
while true; do
    # Replace 'https://spin.slimspeuren.nl' with the actual URL of your Laravel application
    curl -s -o /dev/null -w "%{http_code}\n" https://spin.slimspeuren.nl &
    sleep 0.002  # Adjust this delay to target 500 requests per second
done &

# Version Check Script
while true; do
    # Replace 'https://spin.slimspeuren.nl/version' with the endpoint that exposes version information
    version=$(curl -s https://spin.slimspeuren.nl/version)
    echo "Current Version: $version"
    sleep 5  # Adjust this delay based on your testing requirements
done
