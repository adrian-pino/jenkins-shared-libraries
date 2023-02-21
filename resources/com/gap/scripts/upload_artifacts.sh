#!/bin/bash

# Create a config file (Up to know is manually created, but eventually it would be the output of an ansible-playbook)
echo $(date) >> ~/config.cfg

# Create a tmp folder where we will run the git tasks.
mkdir ~/tmp-folder
cd ~/tmp-folder

# Pull the git repository
git clone git@github.com:adrian-pino/jenkins-common-files.git
cd jenkins-common-files

# Add new artifacts into the repository
cp ~/config.cfg ./config/

# Push the config file into the repository
git add .
git status
git commit -m "Updating the config.cfg file"
git push 

# Clean everything
rm -rf ~/tmp-folder
rm -f ~/config.cfg
