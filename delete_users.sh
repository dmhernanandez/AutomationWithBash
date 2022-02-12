#!/bin/bash
#export FULLNAME
#Se separa el archivo por cada salto de linea
count=0
while IFS= read -r FULLNAME
do
    count=0
    . getUsername.sh
    userdel $USER_NAME
    mv /home/$USER_NAME /home/$USER_NAME.del   

done < users.txt

tail -5 /etc/shadow
