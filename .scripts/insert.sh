#!/bin/bash

rcfile="$1"
snippet="$2"
var=$(<"$snippet")
if grep -q "START" "$rcfile" ;then
   awk -v v="$var" '/START/ {
     print $0
     print v
     f=1
   }f &&!/END/{next}/END/{f=0}!f' "$rcfile" >t && mv t "$rcfile"
else
   echo "#START" >> "$rcfile"
   echo "$var" >> "$rcfile"
   echo "#END" >> "$rcfile"
fi
