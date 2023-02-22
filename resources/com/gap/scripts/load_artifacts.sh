#!/bin/bash

CURRENT_PATH=$(pwd)

# Create a tmp folder where we will run the git tasks.
mkdir ~/tmp-folder
cd ~/tmp-folder

# Pull the git repository
git clone $1
cd jenkins-common-files

# Load the artifact from the Git repo folder
cp ./config/$2 $CURRENT_PATH 
cd $CURRENT_PATH

# Validate that the config file got loaded
echo $2

# Clean everything
rm -rf ~/tmp-folder
