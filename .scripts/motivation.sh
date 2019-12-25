#!/bin/bash
NUMBER=$(( ( RANDOM % 200 )  + 1 ))
#echo "Sentencja numer: " $NUMBER

p="p"
q="'"
CMDTXT="sed -n ${q}$NUMBER${p}${q} /home/migacz/.scripts/motivation.csv"
eval "$CMDTXT"

if [ $NUMBER -eq 50 ]
then
echo  "You should play in lotto - because chance of getting this message is 1 to 200 "
fi
