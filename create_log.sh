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


echo $cpuUsed
for p in $cpu
do
 echo $p
done


echo $datetime




