#!/bin/bash
clear
echo "Made with passion by rb"
echo
echo "|\__/,|   \(\`\ "
echo "|_ _  |.--.) ) "
echo "( W   \)     / "
echo "(((^_(((/(((_/ "
echo
echo "YOU ARE RUNNING THIS AT YOUR OWN RISK"
echo "I TAKE NO RESPONSIBILITY FOR ANY DAMAGES DONE TO YOUR CONSOLE"
echo "it also works on my 13.20 console and ive tried many times to test this script"
echo "survivors bias or something, just make sure the .elf files you add are reputable"
read -p "Press enter after reading..."
clear

check_file () { # Look for IP.txt, if it's there change function to true, add IP to variable
    if [ -e "ip.txt" ]
        then
            fileThere=true
        else
            fileThere=false
    fi

}

save_ip () { # Read user input for IP, save to ip.txt
    read -p "Please enter your PlayStation 5 IP Address: " ps5Ip;
    echo $ps5Ip > ip.txt;
    clear
    main

}

ip_conf () { # Ask user if this actually is their IP just to make sure

    echo "MAKE SURE $ipAddr matches your PS5 IP for sure"
    echo "Unexpected results or errors may occur if they don't"
    echo "Payloads will be sent on port 9021" 
    echo
    read -p "Do they match? [y/n] and then enter: " ipCONF

}

read_payloads () { # Reads folder for all existing .elf files, prints them.
    pushed=0
        for file in elfs/*.elf; do 
            echo "Found: $file"
            ((pushed+=1))
        done
    echo
    echo "Total Found: $pushed"
    echo
}

push_payloads () {
    clear # Reads folder again but this time pushes those files to the PlayStation 5 using NC
    pushed=0
    export PS5_HOST=$ipAddr
    export PS5_PORT=9021 # This defaults to 9021 on the exploit
    echo "Sending to $PS5_HOST:$PS5_PORT good luck!"
    echo
    for file in elfs/*.elf; do
        export PS5_PAYLOAD=$file
        nc -i1 $PS5_HOST $PS5_PORT < $PS5_PAYLOAD # -i1 bc -q0 doesn't work and you can't do -i less than 1 but accomplishes the same thing essentially
        echo ">>> Sent $PS5_PAYLOAD meow! <<<"
        ((pushed+=1))
    done
    echo
    echo "Total Payloads Pushed: $pushed"
}

main () {
    ipAddr=$(< ip.txt) # Writes the contents of ip.txt to the function
    echo "List of payloads:"
    read_payloads
    echo "If your payload is missing, exit out of the script with CTRL+C"
    echo "and make sure they are .elf files that are placed in the elfs/ folder"
    echo
    ip_conf
    if [ $ipCONF = y ]
        then
            push_payloads
            echo "Check your ps5"
            echo "happy homebrewing <3"
            exit
    elif [ $ipCONF = n ]
        then
            clear
            echo "Oops, no worries, let's fix that."
            save_ip
            check_file
    else
        clear
        echo "Invalid response other than y or n, lets try again"
        main
    fi
}

preSteps (){
    check_file
    if [ $fileThere = false ]
        then
            clear
            echo "First start :D"
            echo
            save_ip
            check_file
            main
    else
        clear
        echo "Welcome back ^-^"
        echo
        main
    fi
}
preSteps # This executes everything
