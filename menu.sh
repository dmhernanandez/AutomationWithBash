while true; 
do
    echo "[1] Instalar grafana"
    echo "[2] Desinstalar grafana"
    read -p "Seleccione una opción de 1 a 5 ?" op
    case $op in
        [1]* ) echo "Opción Seleccionada 1 !"; break;;
        [2]* ) echo "Opción Seleccionada 2 !"; break;;
        [3]* ) echo "Opción Seleccionada 3 !"; break;;
        [4]* ) echo "Opción Seleccionada 4 !"; break;;
        [5]* ) echo "Opción Seleccionada 5 !"; break;;        
        * ) echo "Seleccione una Opción de 1 a 5.";;
    esac
done
