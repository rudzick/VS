#!/bin/bash
if [ $# -ne "2" ] # korrekte Anzahl der Kommandozeilenargumente
then
    echo "Aufruf: `$0` schmutzige_Datei saubere_Datei"
    exit -1
fi
   
if [ ! -f "$1" ]       # Prüfen, ob Datei existiert
then
   echo "Datei \"$1\" gibt's nicht."
   exit -1
fi

sed 's#IMPORTANT[[:space:]]\{1,\}##' $1 |\
    sed 's#IMPORTANT![[:space:]]\{1,\}##' | sed 's#[Ii][Ss][Ss][Nn]: \{1,\}##' |\
    sed 's#[Ii][Ss][Ss][Nn]:##' |\
    cut -f 5,12 | tr '\r\n' '\n' | grep '[0-9]' | sort | uniq > $2
cat $2

