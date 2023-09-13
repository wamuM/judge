echo "Jutge Problem URI (i.e P92613, https://jutge.org/problems/P92613_en, etc)";
read link;
# Parse text (I know this is awful but I couldn't figure out a more universal way)
regex="((http)?s?(://)?jutge.org/problems/)?([A-Z]\d{5})_(\w\w)";
echo $link | grep -Eo $regex>"./.match.jutge"
tail -n +3 "./.match.jutge"
if [-z "./.match.jutge"];
  do
    echo "Error: Provided text wasn't a valid jutge.org problem"
    exit;
  fi
{read name; read language}<"./.match.jutge"
  
link="https://jutge.org/problems/$name_$language";
echo "Creating files for '$link'"

# Creating files 
mkdir "./$name"
cd "./$name"
wget -O "jutge.zip" $link 
unzip "jutge.zip" -d ./samples
cp "../.jutge/check-samples.sh" "./check-samples.sh"
mv "./samples/problem.pdf" "./problem.pdf"
mv "./samples/problem.ps" "./problem.ps"
cp "../jutge/template-main.cpp" "./main.cpp"
if test -d "../.jutge/use-git";
do 
  echo Git: Initiating Git repository 
  git init -q
  git add * -q 
  echo Git: Commiting initial state
  git commit -q -m "Automatic First Commit by the Jutge Manager Script"
fi 
