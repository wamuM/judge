echo "Jutge Problem URI (i.e P92613, https://jutge.org/problems/P92613_en, etc)";
read link;
# Parse text (I know this is awful but I couldn't figure out a more universal way)
regex='((http)?s?(://)?jutge.org/problems/)?([:upper:][:digit:]{5})_([:lower:][:lower:])';
echo $link | grep -Eo $regex>"./.match.jutge"
tail -n +3 "./.match.jutge";
if [[ $link=~ $regex]]; 
then 
  name=$(BASH_REMATCH[4]);
  language=$(BASH_REMATCH[5]);
else
    echo "Error: Provided text wasn't a valid jutge.org problem";
    exit 1;
fi
{read name; read language}<${"./.match.jutge"};
rm "./.match.jutge" 
link="https://jutge.org/problems/${name}_${language}";
echo "Creating files for '$link'"

# Creating files 
mkdir "./$name" || exit 1;
cd "./$name" || exit 1;
echo "Downloading files from jutge..."
wget -O "jutge.zip" $link
unzip "jutge.zip" -d ./samples
cp "../.jutge/check-samples.sh" "./check-samples.sh"
mv "./samples/problem.pdf" "./problem.pdf"
mv "./samples/problem.ps" "./problem.ps"
cp "../jutge/template-main.cpp" "./main.cpp"
if test -d "../.jutge/use-git";
then
  echo Git: Initiating Git repository 
  git init -q
  git add * -q 
  echo Git: Commiting initial state
  git commit -q -m "Automatic First Commit by the Jutge Manager Script"
fi 
