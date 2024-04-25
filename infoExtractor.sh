#! /bin/bash



                  ####################################################################################################  
                  #                              Writen by Mugabe N. Ignace                                          #
                  ####################################################################################################




function banner (){
    clear
    echo
    # figlet -ctk -f banner "INFO  EXTRACTOR" | lolcat  
    echo -e "\e[1;32m" 
    figlet -ctk -f banner "INFO EXTRACTOR"
    echo -e "\e[0m"
    # if !command -v lolcat
}

function menu (){
    echo -e "\e[32m" 
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

function iscontinue(){
    echo -e "\e[32m" 
    read -n 1 -s -r -p "Press any key to continue"
    main
}


function main(){
    banner
    menu
    echo -e "\e[1;32m" 
    read -p  " Choose option number you want :: " choice
    echo -e "\e[0m"  

    case $choice in
		0)
            publicIp=$(curl -s ifconfig.co)
			echo -e '\e[32m' "Your Public IP Address are: \e[0m"$publicIp 
            echo 
            iscontinue ;;
        1)
            # privateIp=$(hostname -I)
            privateIp=$(ifconfig |grep -v inet6 | grep inet | awk '{print $2 }')
			echo -e '\e[32m' "Private IP Address: \e[0m"$privateIp 
            echo 
            iscontinue ;;
        2)
            macAddr=$(ifconfig | grep ether | awk '{print "  " $2 }')
			echo -e '\e[32m' "MAC address: \e[0m"$macAddr 
            echo 
            iscontinue ;;
        3)
            # ps aux | awk '{print $3 " "  $1 " "  $2 " " $NF}' | sort -nr | awk '{print " USER: " $2  " PID: " $3 " %CPU: " $1 " COMMAND: " $4}' | head -n 5
            cpuPerc=$(top -bn1 | grep PID -A 5 | awk '{print "\\n\n" $1 "\\t\t\t\t" $2 "\\t\t" $9 "\\t\t" $NF }')
			echo -e '\e[32m' "Top 5 Processes: \e[0m"$cpuPerc 
            echo 
            iscontinue ;;
        4)
            avaMemo=$(free -hw | grep Mem | awk '{print "Total: " $2 ", Used: " $3 ", Free: " $4  ", Shared: "$5 ", Buffers/Cache: " $6 ", Available: " $7}')
			echo -e '\e[32m' "Memory Usage Statisitcs: \n \e[0m"$avaMemo 
            echo 
            iscontinue ;;
        5)
			echo -e '\e[32m' "Active System Services:\n \e[0m"
            service --status-all | grep '+' 
            echo 
            iscontinue ;;
        6)
            echo "Loading..."
            tlfile=$(du -h /home | sort -n | tail -n 10 | awk '{print "\\n\n" "Size: " $1 " File: " $NF }' )
			echo -e '\e[32m' "Top 10 Largest Files: \e[0m" $tlfile
            echo 
            iscontinue ;;
        7)
            exit ;;
        *)
            echo -e "\e[31m Wrong option."
            echo -e "\e[0m"
            echo "Try again in 5 seconds"
            echo
            sleep 5
            main ;;
    esac
}

main