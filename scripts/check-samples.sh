echo Work in Progress
# exit
echo Please enter the name of the binary:
read binpath; 
if test ! -f "./${binpath}";
then 
  echo "Error: Couldn't find binary, make sure you wrote the name properly both here and in the compiler";
  exit 1;
fi 
for file in "./samples/*.inp"
  do 
    if [[ $file =~ $regex ]];
    then 
      name="${BASH_REMATCH[0]}"
    else 
      echo "Error: fatal error at parsing files"
      exit 1 
    fi 
    if test $name -eq "*";
    then 
      echo "Error: No .inp files where found in ./samples"
      exit 1;
    fi
      echo "Executing code with test input ${name}.inp into ${name}.out"
      ./${binpath}<"./samples/${name}.inp" >"./samples/${name}.out"
      echo "Checking differences with expected output ${name}.cor"
      cmp --silent "./samples/${name}.cor" "./samples/${name}.out" && echo "Test ${name} succesfully passed." || echo "DIFFERENCE: Test ${name} gave a different output than expected."       
  done 
  echo "All tests where checked."
