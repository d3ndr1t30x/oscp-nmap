#!/bin/bash

# Prompt for the IP address
read -p "Enter the IP address: " ip_address

# Prompt for sudo password
read -s -p "Enter your sudo password: " sudo_password
echo

# Create nmap directory if it doesn't exist
echo $sudo_password | sudo -S mkdir -p nmap

# Run the first nmap scan
echo $sudo_password | sudo -S nmap -sCV -vvv -oA nmap/script-scan $ip_address

# Add a delay between the scans (e.g., 10 seconds)
echo "Waiting for 10 seconds before starting the second scan..."
sleep 10

# Run the second nmap scan
echo $sudo_password | sudo -S nmap -p- -vvv -T4 -oA nmap/all-ports $ip_address

# Clear the sudo password variable
unset sudo_password

# Confirm completion
echo "nmap scans completed and stored in the 'nmap' directory."

# Optionally, open the nmap directory
xdg-open nmap &
