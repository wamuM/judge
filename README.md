# Jutge Enviroment Scripts 

This code aims at helping users of jutge.org organize and verify their code. 

## Features
### Automatically creates PN folders
When installing, this code creates a folder for every part of your course and puts useful scripts in those folders. 
### Automatically creates problem folders 
Inside a Part folder, the `new.sh` can be used to quickly create a folder for a jutge.org problem. It also downloads a pdf explaining the problem and all of the public tests in the `./PN/PXXXXX/samples` directory.
Moreover it creates a `check-samples.sh` that when executed checks if the compiled code passes those tests. 
### Git
When installing or by adding/removing the './judge/use-git' file you can configure the jutge enviroment script so it automatically inits git in every problem's repository for version control. 
## Requirements
To properly run the scripts one should have installed
- git 
- wget 
- unzip 
(most linux distros have them by default, if not you can very easily google how to install them or check if you have them)
## Installation 
#### 1- Clone Repository 
Clone this repository into your computer by doing `git clone -o git@github.com:wamuM/jutge-enviroment <directory>` (where directory is where you want everything to be, for instance `PRO1`)
#### 2- Run install.sh 
`cd <directory>` into the clonned repository and execute install.sh by doing `bash install.sh`
