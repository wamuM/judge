#!/bin/bash 

echo "Adding another part..."
max=0
for dir in ./P*/ 
do
  echo $dir;
  if [[ $dir =~ \./P([[:digit:]]*)/ ]];
  then
    index="${BASH_REMATCH[1]}"
    if [ "$index" -gt "$max" ];
    then 
      max="$index";
    fi
  fi 
done 
let "max++";
mkdir "./P${max}/"
cp "./.jutge/new.sh" "./P${max}/new.sh"
echo "[+] Part ${max} properly added"
