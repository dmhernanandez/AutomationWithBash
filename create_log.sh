#Script para guardar un Log
log=""

dateTime=$(date +%x" "%X) #Formato de fecha
uptime=$(uptime)

#Se obtiene informacion del uso de memoria en formato amigable al humano, posteriormente
#Se optiene la segunda fila que contiene la informacion de consumo de la memoria, y por
#ultimo se obtiene la tercer palabra que equivale al uso de la memoria en MB.
usedMemory=$(free -h |sed '2q;d' |  awk  '{print $3}')

#Primero se optiene la cantidad de cpu sin uso con el comando top -n1 se optiene una sola 
#actualizacion, posteriormente se sustituyen todos las , por . para poder realizar opera-
#ciones aritmeticas, luego se optiene la tercer fila donde se encuentra informacion de uso
#del cpu y por ultimo se optien la cantidad que esta sin usar
cpuNotUsed=$(top -n1 | sed  's/,/./g' |sed '3p;d' | awk '{print  $8}')

#Para calcular el total de cpu usado se resta 100 menos la cantidad usada y especificamos la
#escala de 2 posiciones decimales y por ultimo es procesado por la calculadora basica.
cpuUsed=$(echo "scale=2; 100.0-$cpuNotUsed" | bc)

#Se obtiene la inforacion del disco principal estableciendo la '/', luego con el comando sed se
#optien la segunda fila donde se encuentra la informacion y se imprime con el comand awk
diskUsed=$(df -h / | sed '2p;d'| awk '{print $3 " de " $2}')


#Obtener uso consumo de red
tx=$(ifconfig ens33 | egrep  'TX packets' | awk '{print $5}' | awk '{ foo = $0 /1024^2 ; printf "%.2f MB\n",foo  }')
rx=$(ifconfig ens33 | egrep  'RX packets' | awk '{print $5}' | awk '{ foo = $0 /1024^2 ; printf "%.2f MB\n",foo  }')

echo "$dateTime - $uptime - Memory $usedMemory - CPU $cpuUsed% - Disk $diskUsed - Network rx $rx tx $tx" >> log$USERNAME.txt




