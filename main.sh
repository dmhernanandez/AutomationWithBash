#!/bin/bash 



function MenuAdmin(){
opusr=0
  sentinela=0
		while [ $sentinela -ne 3 -a $sentinela -ne 1 ]	
		do 
		opcion=$(whiptail --title "Programacion para Sistemas Abiertos II" \
		       --menu "Elige una opción" 10 80 3 \
		       "1" "Añadir usuarios" \
		       "2" "Eliminar usuarios" \
		       "3" "Volver al menu principal"\
		       3>&1 1>&2 2>&3)
                       sentinela=$?
                  
		    case $opcion in 
			1) echo "$BLUE Agregar Usuario $DEFAULT";
				(sudo ./create_users.sh);;
				
			2) echo "$BLUE Eliminar Usuario $DEFAULT";
				(sudo ./delete_users.sh);;
			3) 
                            sentinela=3;;
			
				
		esac 
	        done
}




function MenuInicial(){
sentinela=0

while [ $sentinela -ne 4  -a $sentinela -ne 1 ]
do 
 opcion=$(whiptail --title "Programacion para Sistemas Abiertos II" \
               --menu "Elige una opción" 20 80 4 \
               "1" "Agrear y eliminar usuarios" \
               "2" "Registros del sistema" \
               "3" "Instalacion automatica" \
               "4" " Salir" \
               3>&1 1>&2 2>&3)
        sentinela=$?
    case $opcion in 
        1 ) 
		MenuAdmin
                sentinela=0 #Se restablece el valor del centinela a cero, ya puede ser modificada a 1 en MenuAdmin y no por lo tanto no entraria a este ciclo
		;;
         
        2) 
	       log=$(./create_log.sh)
               whiptail --backtitle "Amacenado en log.txt" --title "Registro de sistema" \
              --msgbox "$log" 15 80;;
        3)
   	   (./grafana.sh);;
         
         4)
            sentinela=4;; 
          
    esac 
done

}


MenuInicial


