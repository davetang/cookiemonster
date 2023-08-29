#!/usr/bin/env bash

set -euo pipefail

git init
git remote add origin git@github.com:{{cookiecutter.github_account}}/{{cookiecutter.project_slug}}.git

git remote -v
if [[ $? -gt 0 ]]; then
   >&2 echo Could not get remote
   exit 1
fi

git pull origin main
git branch --set-upstream-to=origin/main main

>&2 echo Git setup completed
>&2 echo "Please go to Settings->Actions->General->Workflow permissions and set the bullet Read and write permissions"
exit 0
