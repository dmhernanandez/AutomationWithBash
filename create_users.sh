#!/bin/bash
#Se separa el archivo por cada salto de linea
USER_NAME=""
NAME_TO_SAVE=""
count=0
counter_progressbar=0
TEMP_FILE='usradd_temp.txt'
ORIGINAL_FILE='usersadd.txt'
DELETE_USR_FILE='usersdelete.txt'
IS_COMPLETE=0
touch $TEMP_FILE
cat $ORIGINAL_FILE > $TEMP_FILE

#Para obtener la escala se lee la cantidad de filas que tiene el archivo, que equivale al numero de filas
#luego se divide 100 entre la cantidad de lineas. Este valor se usa para crear el porcentaje de la barra de progeso
cantidad=$(wc -l $ORIGINAL_FILE | awk '{print $1}')
escala=$(echo "100.0/$cantidad" | bc)

(while IFS= read -r FULLNAME
do

   count=0
  sleep 1
  echo 	XXX	#Delimitadores usados por whiptail
  counter_progressbar=$((counter_progressbar+1))
  echo $((counter_progressbar*escala))
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
  echo XXX

done < $TEMP_FILE) | whiptail --gauge "Agregando" 8 80 0
rm $TEMP_FILE

