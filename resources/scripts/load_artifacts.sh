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
echo ""
echo "Printing the value of" $2:
echo "---------------------------------"
cat $2

# Clean the repo folder (is no longer needed)
rm -rf ~/tmp-folder
