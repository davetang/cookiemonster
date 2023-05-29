#!/usr/bin/env bash

set -euo pipefail

rmarkdown={{cookiecutter.project_slug}}.Rmd

docker run --rm -u $(stat -c "%u:%g" $HOME) -v $(pwd):$(pwd) -w $(pwd) davetang/rstudio:4.3.0 Rscript -e "rmarkdown::render('${rmarkdown}', output_format = 'powerpoint_presentation')"

if [[ $? -gt 0 ]]; then
   >&2 echo Something went wrong!
   exit 1
fi

>&2 echo Done
exit 0
