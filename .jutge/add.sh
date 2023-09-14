
echo "Adding another part..."
max=0
for dir in ./P*/ 
do 
  if [[ $dir =~ \./P([[:digit:]]*)/ ]];
  then
    if "${BASH_REMATCH[1]}" > $max;
    then 
      max="${BASH_REMATCH[1]}";
    fi
  fi 
done 
let "max++";
mkdir "./P${max}/"
cp "./.jutge/new.sh" "./P${max}/new.sh"
echo "[+] Part ${max} properly added"
