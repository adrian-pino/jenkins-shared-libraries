#!/bin/bash

CURRENT_PATH=$(pwd)

# Create a tmp folder to run the git actions
mkdir ~/tmp-folder
cd ~/tmp-folder

# Pull the git repository where the artifacts are stored
git clone $1
cd jenkins-common-files

# Create "artifacts" folder if not present
mkdir -p $CURRENT_PATH/artifacts

# Load the artifacts from the Git repo folder
cp -r ./config/ $CURRENT_PATH/artifacts
cd $CURRENT_PATH/artifacts

##################################
# Validation
##################################
echo ""
echo "Artifacts downloaded successfully and ready to be used"
ls
echo ""
##################################

# Clean the tmp folder previously created
rm -rf ~/tmp-folder