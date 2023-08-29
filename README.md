Table of Contents
=================

* [Cookiecutter templates](#cookiecutter-templates)
   * [Script template](#script-template)
   * [WDL workflow template](#wdl-workflow-template)
   * [Python3 Virtual Environment](#python3-virtual-environment)
   * [R Markdown documents](#r-markdown-documents)
   * [GitHub README](#github-readme)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->

# Cookiecutter templates

Cookiecutter is a templating tool; you use it to generate new files based on a
template that you or someone else has already defined. For example, let's say
you wanted to write a new Python script. Instead of starting from scratch, you
define a template with some code snippets you commonly use, like some usage
code; this is actually my `new_script` template. Then you run `cookiecutter`
with the template, answer some questions, and the new file/s will be generated
according to what you answered. That's it!

Install [cookiecutter](https://cookiecutter.readthedocs.io/en/latest/) using
`pip`.

```console
pip install cookiecutter
```

## Script template

Generate a new Bash, R, Perl, Python, or Ruby template script that accepts
positional and optional command line arguments.

```console
cookiecutter new_script
```

Or run `cookiecutter` using the template on GitHub by using the `--directory`
[option](https://cookiecutter.readthedocs.io/en/latest/advanced/directories.html).

```console
cookiecutter https://github.com/davetang/cookiemonster --directory=new_script
# project_name [Parse file]: parse_file
# project_slug [parse_file]:
# project_short_description [A one-sentence description of the project]: Testing
# name [Dave Tang]:
# year [2023]:
# Select language:
# 1 - Bash
# 2 - R
# 3 - Perl
# 4 - Python
# 5 - Ruby
# Choose from 1, 2, 3, 4, 5 [1]:
# script_name [parse.sh]:
```

The new script (`parse.sh` by default) will be created with the provided
details.

```console
tree --charset ascii parse_file/
# parse_file/
# |-- parse.sh
# `-- README.md
# 
# 0 directories, 2 files

head parse_file/parse.sh
# #!/usr/bin/env bash
# #
# # Written by Dave Tang
# # Year 2023
# #
# set -euo pipefail
# 
# alpha=unset
# beta=unset
# gamma=unset
```

## WDL workflow template

Generate a new WDL workflow.

```console
cookiecutter wdl_workflow
```

## Python3 Virtual Environment

Generate a helper script used for creating a Python3 virtual environment for
installing tools, etc.

```console
cookiecutter venv
```

## R Markdown documents

Generate a template R Markdown document that outputs a Markdown document or
PowerPoint document. The template also generates a script for rendering the R
Markdown document.

```console
cookiecutter rmd_to_pptx
cookiecutter rmd_to_md
```

## GitHub README

To use this template, first make a GitHub repo on
[github.com](https://github.com/). The project slug needs to match the repo
name you chose on GitHub. The template will generate a Quarto document that
will be rendered automatically into `README.md` by GitHub Actions when you push
to GitHub.

```console
cookiecutter github_readme
```
