#! /bin/bash


# System Diagnostics
# 1. Identify the system's public IP.
# 2. Identify the private IP address assigned to the system's network interface.
# 3. Display the MAC address (masking sensitive portions for security).
# 4. Display the percentage of CPU usage for the top 5 processes.
# 5. Display memory usage statistics: total and available memory.
# 6. List active system services with their status.
# 7. Locate the Top 10 Largest Files in /home.

clear

function banner(){
    echo
    figlet -ctk -f banner "INFO  EXTRACTOR" | lolcat
    echo
}

banner

