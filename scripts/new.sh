echo "Jutge Problem URI (i.e P92613, https://jutge.org/problems/P92613_en, etc)";
read link;
# Parse text (I know this is awful but I couldn't figure out a more universal way)
regex='^((https?://)?jutge\.org/problems/)?([[:upper:]][[:digit:]]{5})_([[:lower:]][[:lower:]])';
if [[ $link =~ $regex ]];
then 
  name="${BASH_REMATCH[3]}";
  language="${BASH_REMATCH[4]}";
else
    echo "Error: Provided text wasn't a valid jutge.org problem";
    exit 1;
fi
link="https://jutge.org/problems/${name}_${language}";
echo "Generating files for ${name} (lang ${language})"

# Creating files 
mkdir "./$name" || exit 1;
cd "./$name" || exit 1;
echo "Downloading files from jutge..."
wget -O "jutge.zip" "${link}/zip"
unzip "jutge.zip" -d .
rm "jutge.zip"
mv "./${name}_${language}" "./samples"
cp "../../.jutge/check-samples.sh" "./check-samples.sh"
mv "./samples/problem.pdf" "./problem.pdf"
mv "./samples/problem.ps" "./problem.ps"
cp "../../.jutge/template-main.cpp" "./main.cpp"
if test -d "../../.jutge/use-git";
then
  echo "Git: Initiating Git repository..." 
  git init -q
  git add * -q 
  echo "Git: Commiting initial state..."
  git commit -q -m "Automatic First Commit by the Jutge Manager Script"
fi 
