#!/bin/bash
# TODO: Solve Git authorization (user:pass, ssh-key)
# Goal: Store a lightweight artifact (config file, log file) on a Git repository

# Create a config file (Up to know is manually created, but eventually it would be the output of an ansible-playbook)
echo $(date) >> ~/config.cfg

# Create a tmp folder where we will run the git tasks.
mkdir ~/tmp-folder
cd ~/tmp-folder

# Pull the git repository
git clone $1
cd jenkins-common-files

# Add new artifacts into the repository
cp ~/config.cfg ./config/

# Push the config file into the repository
git add .
git commit -m "Updating the config.cfg file"
git push 

# Clean everything
rm -rf ~/tmp-folder
rm -f ~/config.cfg
