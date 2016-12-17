#!/bin/bash

echo -e "\033[0;32mDeploying updates to Github...\033[0m"

# Build the project.
../lipi/exec/hugo

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git pull https://skulsky:amsDhl987lhd@github.com/skulsky/skulsky.www.git origin master
git push https://skulsky:amsDhl987lhd@github.com/skulsky/skulsky.www.git master
git subtree push --prefix=public https://skulsky:amsDhl987lhd@github.com/skulsky/skulsky.www.git gh-pages
#git push https://skulsky:amsDhl987lhd@github.com/skulsky/skulsky.github.io.git master

read -p "Press any key to continue... " -n1 -s