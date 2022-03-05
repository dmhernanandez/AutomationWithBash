#!/bin/bash
#La variable FULLNAME se crea en el scritp padre create_users.sh

IFS="/"
 #Se estable que Internal First Separator ser la / 
 for nom in $FULLNAME
 do

   count=$((count+1))
   if [ $count -eq 1 ] #Se valida que sean los nombres ya que seran los primeros
   then
     USER_NAME=${nom:0:1}
	#se valida que sean los apellidos que serian la segunda parte, en caso de que se coloquen 		#mas / no tendrian ningun efecto ya que solo se evaluan las dos primeras partes de la 		#cadena.
  elif [ $count -eq 2 ]
  then
    USER_NAME+=$(echo $nom | awk '{print $1}')
    USER_NAME=$(echo $USER_NAME | tr [[:upper:]] [[:lower:]])

   break
   fi
 done
