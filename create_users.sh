#!/bin/bash
#Se separa el archivo por cada salto de linea
FULLNAME=""
USER_NAME=""
NAME_TO_SAVE=""
count=0
while IFS= read -r FULLNAME
do
   count=0
   NAME_TO_SAVE=$FULLNAME
   #Cada linea se divide por espacio
   . getUsername.sh
   #adduser $USER_NAME 
   echo  $NAME_TO_SAVE
   if [ $? -gt 0 ]
   	then
            echo $NAME_TO_SAVE >> usersdelete.txt
   	    sed -i '/$NAME_TO_SAVE/d' usersadd.txt
	fi
   

done < usersadd.txt

tail -5 /etc/shadow



