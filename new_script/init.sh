#!/usr/bin/env bash

set -euo pipefail

cat <<EOF > cookiecutter.json
{
   "project_name": "Parse file",
   "project_slug": "{{ cookiecutter.project_name.lower().replace(' ', '_') }}",
   "project_short_description": "A one-sentence description of the project",
   "name": "Dave Tang",
   "year": "2023",
   "language": ["Bash", "R", "Perl", "Python", "Ruby"],
   "script_name": "parse.sh"
}
EOF

mkdir -p hooks
cat <<EOF > hooks/post_gen_project.py
import sys
import shutil
# import os
# print(os.getcwd())
if '{{cookiecutter.language}}' == "Bash":
   shutil.move('template/argv.sh', '{{cookiecutter.script_name}}')
elif '{{cookiecutter.language}}' == "R":
   shutil.move('template/argv.R', '{{cookiecutter.script_name}}')
elif '{{cookiecutter.language}}' == "Perl":
   shutil.move('template/argv.pl', '{{cookiecutter.script_name}}')
elif '{{cookiecutter.language}}' == "Python":
   shutil.move('template/argv.py', '{{cookiecutter.script_name}}')
elif '{{cookiecutter.language}}' == "Ruby":
   shutil.move('template/argv.rb', '{{cookiecutter.script_name}}')
else:
   print("Unsupported language")
   sys.exit(1)
shutil.rmtree('template')
sys.exit()
EOF

proj_dir={{cookiecutter.project_slug}}
mkdir -p ${proj_dir} && cd ${proj_dir}

cat <<EOF > README.md
# {{ cookiecutter.project_name }}

{{ cookiecutter.project_short_description }}
EOF

>&2 echo Done
exit 0
