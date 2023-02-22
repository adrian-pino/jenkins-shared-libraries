#!/bin/bash

CURRENT_PATH=$(pwd)

# Create a tmp folder where we will run the git tasks.
mkdir ~/tmp-folder
cd ~/tmp-folder

# Pull the git repository
git clone git@github.com:adrian-pino/jenkins-common-files.git
cd jenkins-common-files

# Add new artifacts into the repository
cp ./config/config.cfg $CURRENT_PATH 
cd $CURRENT_PATH

# Validate that the config file got loaded
cat config.cfg

# Clean everything
rm -rf ~/tmp-folder
