#!/bin/bash

echo '====== [ WELCOME TO ID DataBase ] ======'
echo ' '

echo "Enter '1' for Login"
echo "Enter '2' for Create new account"
echo "Enter 'Q' for Exit"
echo ' '

#Option entry
read -p 'Enter here: ' option

if [ $option == 1 ]
#Login Script
then
	iddb_user=$(cat database/iddb_user.txt)
	iddb_pass=$(cat database/iddb_pass.txt)

	clear
	echo '====== [ Login ] ======'
	read -p 'Enter your Username: ' user
	read -p 'Enter your Password: ' pass

	if [ $user == $iddb_user ] && [ $pass == $iddb_pass ]
	then
		clear
		echo '============== [ WELCOME TO ID DataBase ] =============='
		./database/banner.sh
		echo ' '
		iddb_user=$(cat database/iddb_user.txt)
		echo 'Username: '$iddb_user

		echo 'Password: ******'

		iddb_country=$(cat database/iddb_country.txt)
		echo 'Country: '$iddb_country

		iddb_ip=$(cat database/iddb_ip.txt)
		echo 'IP Address: '$iddb_ip

	else
		echo 'Invalid Username or incorrect password, try again!'
	fi
else

	if [ $option == 2 ]
	#Register your ID
	then
		clear
		echo '====== [ Create a new account ] ======'
		echo ' '

		read -p 'Create your username: ' userc
		echo $userc > database/iddb_user.txt

		read -p 'Create your password: ' passc
		echo $passc > database/iddb_pass.txt

		read -p 'Enter your Country: ' countryc
		echo $countryc > database/iddb_country.txt

		read -p 'Enter your IP Address: ' ipc
		echo $ipc > database/iddb_ip.txt

		spinner() {
	    local i sp n
	    sp='/-\|'
	    n=${#sp}
	    printf ' '
	    while sleep 0.1; do
	        printf "%s\b" "${sp:i++%n:1}"
	    done
	}

		printf 'Creating your account... '
		spinner &

		# Processing animation will stop in 5 seconds
		sleep 5

		# kill the spinner
		kill "$!" 
		printf '\n'

		echo 'Account created successfully!'
		else

		if [[ $option = "q" ]] || [[ $option = "Q" ]] 
		then
		#Exit script
			exit 1 
		else 
		    echo "Invalid Input." 
		fi
	fi
fi