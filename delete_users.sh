#!/bin/bash
#export FULLNAME
#Se separa el archivo por cada salto de linea
count=0
while IFS= read -r USER_TO_DELETE
do
    #userdel $USER_TO_DELETE
    # mv /home/$USER_TO_DELETE /home/$USER_TO_DELETE.del
    sed -i "/$USER_TO_DELETE/d" usersdelete.txt   
    if [ $? -eq 0 ]
    then
	  echo "$USER_TO_DELETE eliminado exitosamente"
     else 
       echo "Error al eliminar usuario $USER_TO_DELETE"
	   
     fi

done < usersdelete.txt

tail -5 /etc/shadow
