echo "================================="
echo ""
echo "     W e l c o m e    T o"
echo "             T h e           "
echo " J u t g e    E n v i r o m e n t"
echo "      I n s t a l l e r"
echo ""
echo "================================="
echo CC-BY-SA wamu_M 2023
# Create PN folders
echo "ID of the last part (i.e for P0,P1,P2,P3,P4 it would be 4)"
read parts; 
i=0;
while test $i -le $parts;
do 
   mkdir "P$i"
   cp "./scripts/new.sh" "./P$i/new.sh"
   let "i++"
done
# Creating directory 
mkdir .jutge
cp "./scripts/check-samples.sh" "./.jutge/check-samples.sh"
cp "./scripts/template-main.cpp" "./.jutge/template-main.cpp"
# Settings 
read -p "Do you want to automatically init git in every problem (recommended)?[Y/n]" shouldGit
case $shouldGit in 
  [Nn]* ) rem; break;;
  * ) touch "./.jutge/use-git";;
esac 
# Clear afterwards
read -p "Do you want to clear the installation files (recomended)[Y/n]?" shouldClear
case $shouldClear in 
  [Nn]* ) exit; break;;
  * ) echo "Deleting installation files...";;
esac 
rm -r ./scripts/ 
rm init.sh 
rm -rf "./.git" 
rm README.md 
rm LICENSE
echo Installation Completed!
