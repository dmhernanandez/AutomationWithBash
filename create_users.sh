#!/bin/bash
#Se separa el archivo por cada salto de linea
USER_NAME=""
NAME_TO_SAVE=""
count=0
TEMP_FILE='usradd_temp.txt'
ORIGINAL_FILE='usersadd.txt'
DELETE_USR_FILE='usersdelete.txt'
IS_COMPLETE=0
touch $TEMP_FILE
cat $ORIGINAL_FILE > $TEMP_FILE
while IFS= read -r FULLNAME
do

   count=0
   IS_COMPLETE=0
     #Cada linea se divide por espacio
   . getUsername.sh
    adduser $USER_NAME 
   
   if [[ $IS_COMPLETE -eq 1 && $? -eq 0 ]]
   then 
       echo $USER_NAME >> usersdelete.txt
       sed -i "/$FULLNAME/d" $ORIGINAL_FILE
       echo "Usuario $USER_NAME creado exitosamente"
   else
	echo "Error al crear usuario $USER_NAME"
   
   fi
  

done < $TEMP_FILE
rm $TEMP_FILE

