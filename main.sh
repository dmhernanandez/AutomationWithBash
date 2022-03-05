#!/bin/bash 
ESC=$(printf '\033') 
RESET="${ESC}[0m" 
BLACK="${ESC}[30m" 
RED="${ESC}[31m"
GREEN="${ESC}[32m" 
GREENC="${ESC}[1;30m" 
YELLOW="${ESC}[33m" 
BLUE="${ESC}[34m" 
MAGENTA="${ESC}[35m"
CYAN="${ESC}[36m" 
WHITE="${ESC}[37m" 
DEFAULT="${ESC}[39m"

BOLD=$(tput bold)

echo -e "$BOLD$GREEN __________  _________   _____ $GREEN            $YELLOW .___.___ "
echo -e "$BOLD$GREEN \______   \/   _____/  /  _  \ $GREEN           $YELLOW |   |   |"
echo -e "$BOLD$GREEN  |     ___/\_____  \  /  /_\  \ $GREEN $BLACK  ______ $BLACK$YELLOW |   |   |"
echo -e "$BOLD$GREEN  |    |    /        \/    |    \ $GREEN$BLACK /_____/ $BLACK$YELLOW |   |   |"
echo -e "$BOLD$GREEN  |____|   /_______  /\____|__  /  $GREEN         $YELLOW|___|___|"
echo -e "$BOLD$GREEN                  \/         \/                   "
echo -e ""
echo -e "\e[3m $GREEN         Programaciòn para Sistemas Abiertos II\e[0m"
echo -e "\e[3m $YELLOW             Catedratico: Luis Valle\e[0m"
echo -e ""
echo -e "\e[3m $GREEN		            Integrantes"
echo -e "\e[3m $YELLOW         Alfredo Nataren Baires        231051103 \e[0m"
echo -e "\e[3m $YELLOW         Blanca Sarahi Osorto Mendez   201710110129  \e[0m"
echo -e "\e[3m $YELLOW         Dany Mauricio Hernandez       201810030004  \e[0m"
echo -e "\e[3m $YELLOW         Wilmer Alexander Martinez     201810010311 \e[0m"


function MenuAdmin(){
opusr=0
		while [ "$opusr" -ne 3 ];		
		do 
		    echo ""
		    echo -e "[$CYAN 1 $DEFAULT] Agregar Usuario"
		    echo -e "[$CYAN 2 $DEFAULT] Eliminar Usuario"
		    echo -e "[$CYAN 3 $DEFAULT] Salir"
		    read -p "Seleccione una opción de 1 a 3: " opusr
		    echo ""
		    case $opusr in 
			[1]* ) echo "$BLUE Agregar Usuario $DEFAULT";
				(sudo ./create_users.sh)
				MenuInicial
				break;;
			[2]* ) echo "$BLUE Eliminar Usuario $DEFAULT";
				(sudo ./delete_users.sh)
				MenuInicial
				break;;
		esac 
	        done
}




function MenuInicial(){
while true  
do 
    echo ""
    echo -e "[$RED 1 $DEFAULT] Administraciòn de usuarios" 
    echo -e "[$RED 2 $DEFAULT] Registros del Sistema"
    echo -e "[$RED 3 $DEFAULT] Instalar Grafana"
    echo -e "[$RED 4 $DEFAULT] Salir"
    read -p "Seleccione una opción de 1 a 4: " op 
    echo ""
    case $op in 
        [1]* ) echo "$BLUE Administraciòn de Usuarios $DEFAULT"; 
		MenuAdmin
	      break;; 
        [2]* ) echo "$BLUE Registros del Sistema $DEFAULT";
		(./create_log.sh)
		MenuInicial
	       break;; 
        [3]* ) echo "$BLUE Instalacion de Grafana $DEFAULT";
		(./grafana.sh)
		MenuInicial
		break;; 
	[4]* ) echo "$BLUE Salir $DEFAULT"; 
		exit;
	      break;;        
        * ) echo "Seleccione una Opción de 1 a 4.";; 
    esac 
done


echo -e "$DEFAULT" 
}


MenuInicial


