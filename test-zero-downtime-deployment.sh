#!/bin/bash

# Function to stop the script
stop_script() {
    echo "Stopping script..."
    exit 0
}

# Trap Ctrl+C signal to call the stop_script function
trap stop_script SIGINT

# Main Script
while true; do
    # Retrieve the HTML content
    html_content=$(curl -s https://spin.slimspeuren.nl/version)

    # Extract the timestamp from the HTML using awk
    timestamp=$(echo "$html_content" | awk -F'Changed On: ' '/<p>Changed On:/{print $2}')

    # Output the timestamp
    echo "$timestamp"

    # Hit the endpoint to simulate traffic
    curl -s https://spin.slimspeuren.nl > /dev/null &

    # Sleep for 0.002 second = 500 request p/s
    sleep 0.002  # Adjust this delay based on your testing requirements
done
