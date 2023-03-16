#!/bin/bash

# Input Variables:
# $1 = Repository location. Git repository containing the artifacts
# $2 = Destination Path. Path where the artifacts will be dumped (e.g: /opt/artifacts)

CURRENT_PATH=$(pwd)

# Create a tmp folder to download the git repo
cd $(mktemp -d)
TEMPORAL_PATH=$(pwd)

# Download the git repo
git clone $1
cd $(ls)
rm -rf .git README.md

# Move the artifacts from the tmp folder to the destination path
mkdir -p $2
cp -r . $2
echo "Artifacts downloaded in '$2'"

# Clean the tmp folder previously created
rm -rf $TEMPORAL_PATH
