echo "Jutge Problem URI (i.e P92613, https://jutge.org/problems/P92613_en, etc)";
read problem;
regex = "(?:(?:http)?s?(?:://)?jutge.org/problems/)?([A-Z]\d{5})_(\w\w)";
if [[$link =~ $regex]];
then 
  name=${BASH_REMATCH[1]};
  language=${BASH_REMATCH[2]};
else 
  echo "Error: Provided text wasn't a valid jutge.org problem";
  exit;
fi
link = "https://jutge.org/problems/$name_$language";
echo "Creating files for '$link'"
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
