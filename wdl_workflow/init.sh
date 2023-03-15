#!/usr/bin/env bash

set -euo pipefail

cat <<EOF > cookiecutter.json
{
   "project_name": "New workflow",
   "project_slug": "{{ cookiecutter.project_name.lower().replace(' ', '_') }}",
   "project_short_description": "A one-sentence description of the workflow",
   "name": "Dave Tang",
   "email": "me@davetang.org",
   "year": "2023",
   "number_tasks": "5",
   "workflow_name": "processing"
}
EOF

mkdir -p hooks
cat <<EOF > hooks/post_gen_project.py
import sys
def create_task(task_name):
   task_block = '''\
   #
   # %s %s
   # %s
   #
   version 1.0
   task %s {
      input {
         String word
      }
   
      String add_word = sub(word, "^", "deez ")
   
      command <<<
         set -euo pipefail
         echo ~{add_word} > output.txt
      >>>
   
      output {
         File outfile = "output.txt"
      }
   
      runtime {
         cpu: 1
      }
   
      parameter_meta {
         word: "String to output"
      }
   }''' % ('{{cookiecutter.name}}', '{{cookiecutter.year}}', '{{cookiecutter.email}}', task_name)
   return(task_block)

num = {{cookiecutter.number_tasks}}
for i in range(0, num):
   with open('task' + str(i) + '.wdl', 'w') as f:
      print(create_task('task' + str(i)), file = f)

with open('{{cookiecutter.workflow_name}}' + '.wdl', 'w') as f:
   print('''\
#
# %s %s
# %s
#
version 1.0
   ''' % ('{{cookiecutter.name}}', '{{cookiecutter.year}}', '{{cookiecutter.email}}'), file = f)
   for i in range(0, num):
      print(f'import "task{i}.wdl" as task{i}', file = f)
   print('''\
workflow %s {
   input {
      String word
   }
   ''' % ('{{cookiecutter.workflow_name}}'), file = f)
   for i in range(0, num):
      print('''\
   call task%s.task%s {
      input:
         word = word
   }
   ''' % (i, i), file = f)
   print('''\
   output {
      File outfile = task0.outfile
   }
}
   ''', file = f)
sys.exit()
EOF

proj_dir={{cookiecutter.project_slug}}
mkdir -p ${proj_dir} && cd ${proj_dir}

cat <<EOF > README.md
# {{ cookiecutter.project_name }}

{{ cookiecutter.project_short_description }}

Run workflow

    java -jar womtools.jar inputs {{ cookiecutter.workflow_name }}.wdl > {{cookiecutter.workflow_name}}.json
    java -jar cromwell.jar run {{ cookiecutter.workflow_name }}.wdl -i {{cookiecutter.workflow_name}}.json
EOF

>&2 echo Done
exit 0
