#!/bin/bash
#export FULLNAME
#Se separa el archivo por cada salto de linea
counter_progressbar=0
FILE="usersdelete.txt"
#Para obtener la escala se lee la cantidad de filas que tiene el archivo, que equivale al numero de filas
#luego se divide 100 entre la cantidad de lineas. Este valor se usa para crear el porcentaje de la barra de progeso
cantidad=$(wc -l $FILE | awk '{print $1}')
escala=$(echo "100.0/$cantidad" | bc)


(while IFS= read -r USER_TO_DELETE
do
     sleep 1
     echo XXX	#Delimitadores usados por whiptail
     counter_progressbar=$((counter_progressbar+1))
     echo $((counter_progressbar*escala))

    userdel $USER_TO_DELETE 
    if [ $? -eq 0 ]
    then
	  mv /home/$USER_TO_DELETE /home/$USER_TO_DELETE.del
	  sed -i "/$USER_TO_DELETE/d" usersdelete.txt 
	  echo "$USER_TO_DELETE eliminado exitosamente"
     else 
       echo "Error al eliminar usuario $USER_TO_DELETE"
	   
     fi
   echo XXX
done < $FILE)  | whiptail --gauge "Eliminando" 8 80 0

tail -5 /etc/shadow
