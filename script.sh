#!/bin/bash
echo "Creando usuarios....."
i=0
while [ $i -lt 3 ]
do
 useradd  tester$i
 echo tester$i
 i=$((i+1))
done

tail -5 /etc/shadow
