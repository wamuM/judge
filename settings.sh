#!/bin/sh 

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
echo "          S e t t i n g s"
echo ""
echo "================================="
echo "CC-BY-SA wamu_M 2023"

while true;
do
echo ""
echo "Select an option:"
shouldGit=$(fetchConfig "use-git" && echo "Yes" || echo "No (Default)");
shouldVerbose=$(fetchConfig "verbose" && echo "Yes (Default)" || echo "No");
shouldExport=$(fetchConfig "export" && echo "Yes (Default)" || echo "No")
echo "g) Automatically initialize Git in Problem Folders? ${shouldGit}"; 
echo "v) Have unzip and wget be verbose? ${shouldVerbose}"; 
echo "e) Copy main.cpp into export.cpp to easily upload to jutge.org? ${shouldExport}"
echo "q) [quit] Quit settings manager";
read -p "#? " config
case $config in 
  "g") toggleFile "use-git";
    ;;
  "c") toggleFile "clear-install";
    ;;
  "v") toggleFile "verbose";
    ;;
  "e") toggleFile "export";
    ;;
  "q") break;
    ;;
  *)
    echo "Please select a valid config option:";
    ;;
esac; 
done; 
