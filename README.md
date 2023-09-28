# Jutge Enviroment Scripts 

This code aims at helping users of jutge.org organize and verify their code. 

## Features
### Automatically creates PN folders
When installing, this code creates a folder for every part of your course and puts useful scripts in those folders. 
### Automatically creates problem folders 
Inside a Part folder, the `new.sh` can be used to quickly create a folder for a jutge.org problem. It also downloads a pdf explaining the problem and all of the public tests in the `./PN/PXXXXX/samples` directory.
Moreover it creates a `check-samples.sh` that when executed checks if the compiled code passes those tests. 
### Git
You can configure the jutge enviroment script so it automatically inits git in every problem's repository for version control. 
### Exports
Puts the most recent main.cpp file to have passed the check-samples.sh into the main directory with the name `export.cpp` to easily upload it to jutge.org 
### Settings Manager
Run `bash settings.sh` in the main directory to open the setting manager script. 
## Requirements
To properly run the scripts one should have installed
- git 
- wget 
- unzip 
(most linux distros have them by default, if not you can very easily google how to install them or check if you have them)
## Installation 
#### 1- Clone Repository 
Clone this repository into your computer by doing `git clone https://github.com/wamuM/jutge-enviroment <directory>` (where directory is where you want everything to be, for instance `PRO1`)
#### 2- Run install.sh 
`cd <directory>` into the clonned repository and execute install.sh by doing `bash install.sh`
## Updating 
### 1- Clone Updated Repository 
Clone this repository into your computer (**not the same directory as the not updated one**) by doing `git clone https://github.com/wamuM/jutge-enviroment <directory>` (where directory is where you want everything to be for instance `UPDATE_PRO1`) 
### 2 - Run update.sh 
`cd <directory>` into the clonned repository and execute install.sh by doing `bash update.sh`
