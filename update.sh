#!/bin/sh 

echo "Welcome to the Jutge Enviroment Update Script"
echo ""
echo "Directory to update?"
read -p "#? " directory
mv -f "./.jutge/" "${directory}/.jutge/"
mv -f "./settings.sh" "${directory}/settings.sh"

while true: 
do 
echo ""
echo "Select extra options:"
updateNew="Yes"
updateCheck="No"
echo "n) Update all new.sh files? ${shouldVerbose}"; 
echo "c) Update all check-samples.sh files? ${parts}";
echo "u) [update] Proceed with update";
read -p "#? " config 
case $config in 
  "n") test $updateNew -eq "Yes" && updateNew="No" || updateNew="Yes"
    ;;
  "c") test $updateCheck -eq "Yes" && updateCheck="No" || updateCheck="Yes"
    ;;
  "u") break;
    ;;
  *)
    echo "Please select a valid config option:";
    ;;
esac; 
done;

echo "[=] Applying preferences..."
for part in ./P*/ 
do
  if test $updateNew -eq "Yes";
  then 
    cp -f "./.jutge/new.sh" "${part}/new.sh"
  fi 
  for problem in "./${part}/*/" 
  do 
    if test $updateCheck -eq "Yes";
    then
      cp -f "./.jutge/check-samples.sh" "${problem}/check-samples.sh" 
    fi 
  done 
done 
echo "[+] Enviroment Succesfully Updated!"
