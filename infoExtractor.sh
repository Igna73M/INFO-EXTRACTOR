#! /bin/bash



# System Diagnostics
# 1. Identify the system's public IP.
# 2. Identify the private IP address assigned to the system's network interface.
# 3. Display the MAC address (masking sensitive portions for security).
# 4. Display the percentage of CPU usage for the top 5 processes.
# 5. Display memory usage statistics: total and available memory.
#  free -h | lolcat 
# 6. List active system services with their status.

# 7. Locate the Top 10 Largest Files in /home.

# du -h | sort -n | tail -n 10 | awk -F '/' '{print $NF "and storage of :" $1}' | lolcat



function banner (){
    clear
    echo
    figlet -ctk -f banner "INFO  EXTRACTOR" | lolcat  
    echo
}

function menu (){
        echo -e "\e[1;32m" 
        figlet -k -f small "    OPTION: "
        echo " 0. Identify the system's public IP." 
        echo " 1. Identify the private IP address assigned to the system's network interface." 
        echo " 2. Display the MAC address (masking sensitive portions for security)." 
        echo " 3. Display the percentage of CPU usage for the top 5 processes." 
        echo " 4. Display memory usage statistics: total and available memory." 
        echo " 5. List active system services with their status." 
        echo " 6. Locate the Top 10 Largest Files in /home" 
        echo " 7. Exit" 
        echo -e "\e[0m"
    }


function main(){
    banner
    menu
    
    cowsay -f tux " Choose an option from 0 to 7 : " | lolcat 
    read choice  

    case $choice in
		0)
			echo "Hello";;
        1)
			echo "IP Address:"
            hostname -I ;;
        2)
			echo "Hello";;
        3)
			echo "Hello";;
        4)
			echo "Hello";;
        5)
			echo "Hello";;
        6)
			echo "Hello";;
        7)
			exit ;;
        *)
            echo "Try again"
            main
    esac
}

main