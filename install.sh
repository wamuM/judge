#!/bin/bash 

function fetchConfig(){
  test -f "./.jutge/$1" && return 0 ||  return 1;
}
function toggleFile {
  # $toggleFile_file
  if fetchConfig $1
  then
    rm "./.jutge/$1"
  else 
    touch "./.jutge/$1"
  fi
  
}

echo "================================="
echo ""
echo "     W e l c o m e    T o"
echo "             T h e           "
echo " J u t g e    E n v i r o m e n t"
echo "      I n s t a l l e r"
echo ""
echo "================================="
echo "CC-BY-SA wamu_M 2023"

shouldInstall="no";
parts=1;

while true;
do
echo ""
echo "Select an option:"
shouldGit=$(fetchConfig "use-git" && echo "Yes" || echo "No (Default)");
shouldClear=$(fetchConfig "clear-install" && echo "Yes (Default)" || echo "No");
shouldVerbose=$(fetchConfig "verbose" && echo "Yes (Default)" || echo "No");
echo "g) Automatically initialize Git in Problem Folders? ${shouldGit}"; 
echo "c) Clear installation files when done? ${shouldClear}"; 
echo "v) Have unzip and wget be verbose? ${shouldVerbose}"; 
echo "p) Number of parts: ${parts}";
echo "i) [install] Proceed with installation";
read -p "#? " config
case $config in 
  "g") toggleFile "use-git";
    ;;
  "c") toggleFile "clear-install";
    ;;
  "v") toggleFile "verbose";
    ;;
  "p") read -p "How many parts do you want? " parts;
    ;;
  "i") break;
    ;;
  *)
    echo "Please select a valid config option:";
    ;;
esac; 
done;
echo ""
echo "[=] Starting installation..."
mv "./.jutge/add.sh" "./add.sh"
i=0;
while test $i -le $parts;
do 
   mkdir "P$i"
   cp "./.jutge/new.sh" "./P$i/new.sh"
   let "i++"
done

if fetchConfig "clear-install";
then 
echo "[+] Installation files cleared"
rm install.sh LICENSE README.md "./.jutge/clear-install"
rm -rf "./.git/" 
fi 
echo "[+] Installation Completed!"
