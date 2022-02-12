#!/bin/bash
#Se separa el archivo por cada salto de linea
FULLNAME=""
USER_NAME=""
count=0
while IFS= read -r FULLNAME
do
 count=0s
   #Cada linea se divide por espacio
   . getUsername.sh
   adduser $USER_NAME  
   

done < users.txt

tail -5 /etc/shadow



