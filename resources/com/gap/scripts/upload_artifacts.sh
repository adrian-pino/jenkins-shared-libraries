#!/bin/bash

# Create a confif.file (This should be created by a run of an ansible-playbook before)
echo $(date) >> ~/config.cfg

# Create a tmp folder where we will run the git tasks.
mkdir ~/tmp-folder
cd ~/tmp-folder

# Pull the git repository
git clone git@github.com:adrian-pino/jenkins-common-files.git
cd jenkins-common-files

# Add new artifacts into the repository
cp ~/config.cfg ./config/

# Push the config file in to the repository
git add .
git status
git commit -m "Updating the config.cfg file"
git push 

# Clean everything
rm -rf ~/tmp-folder
rm -f ~/config.cfg
