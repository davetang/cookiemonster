#!/usr/bin/env bash

set -euo pipefail

rmarkdown={{cookiecutter.project_slug}}.Rmd
markdown=$(basename ${rmarkdown} .Rmd).md
img_source=$(cat ${rmarkdown} | grep "knitr::opts_chunk\$set(fig.path" | cut -f2 -d '=' | sed 's/[")]//g;s/\/\n$//')

# modify directories accordingly
home=/home/{{cookiecutter.user}}/Analysis

# MkDocs directory
analysis_dest=${home}/docs/docs/analysis/
img_dest=${home}/docs/docs/img/

r_version={{cookiecutter.r_version}}
module load r/${r_version}

Rscript -e ".libPaths('${home}/tools/r-${r_version}_packages/'); rmarkdown::render('${rmarkdown}')"

if [[ ! -e ${markdown} ]]; then
   >&2 echo ${markdown} was not generated!
   exit 1
fi

cp -f ${markdown} ${analysis_dest}
cp -rf ${img_source} ${img_dest} || >&2 echo No images to copy

>&2 echo Done
exit 0
