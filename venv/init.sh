#!/usr/bin/env bash

set -euo pipefail

cat <<EOF > cookiecutter.json
{
   "project_name": "Project name",
   "project_slug": "{{ cookiecutter.project_name.lower().replace(' ', '_') }}",
   "project_short_description": "A one-sentence description of the virtual environment",
   "name": "Dave Tang",
   "year": "2023",
   "script_name": "create_venv.sh",
   "dir_name": "venv"
}
EOF

proj_dir={{cookiecutter.project_slug}}
mkdir -p ${proj_dir} && cd ${proj_dir}

cat <<EOF > README.md
# {{ cookiecutter.project_name }}

{{ cookiecutter.project_short_description }}
EOF

>&2 echo Done
exit 0
