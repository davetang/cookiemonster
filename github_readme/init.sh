#!/usr/bin/env bash

set -euo pipefail

cat <<EOF > cookiecutter.json
{
   "project_name": "New analysis",
   "project_slug": "{{ cookiecutter.project_name.lower().replace(' ', '_') }}",
   "project_short_description": "A one-sentence description of the analysis",
   "github_account": "davetang",
   "engine": ["knitr", "jupyter"],
   "name": "Dave Tang",
   "email": "davetingpongtang@gmail.com"
}
EOF

proj_dir={{cookiecutter.project_slug}}
mkdir -p ${proj_dir}

>&2 echo Done
exit 0
