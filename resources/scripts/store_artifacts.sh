#!/bin/bash

# Input Variables:
# $1 = Repository location. Git repository that stores the artifacts
# $2 = Artifacts location path. Folder containing the artifacts to be stored (e.g: /opt/artifacts/)

# Create a tmp folder to download the git repo
cd $(mktemp -d)
TEMPORAL_PATH=$(pwd)

# Download the git repo
git clone $1
cd $(ls)

# Copy *all* the artifacts from the artifacts location path into the git repo folder (.)
cp -r $2* .

# Push the code containing the artifacts
commit_message="Uploading artifacts from Jenkins. Updated: $(date)"
git add . && git commit -m "$commit_message" && git push 

# Clean the tmp folder previously created
rm -rf $TEMPORAL_PATH
