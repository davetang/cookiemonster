import sys
def create_task(task_name):
   task_block = '''   #
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
   print('''#
# %s %s
# %s
#
version 1.0
   ''' % ('{{cookiecutter.name}}', '{{cookiecutter.year}}', '{{cookiecutter.email}}'), file = f)
   for i in range(0, num):
      print(f'import "task{i}.wdl" as task{i}', file = f)
   print('''workflow %s {
   input {
      String word
   }
   ''' % ('{{cookiecutter.workflow_name}}'), file = f)
   for i in range(0, num):
      print('''   call task%s.task%s {
      input:
         word = word
   }
   ''' % (i, i), file = f)
   print('''   output {
      File outfile = task0.outfile
   }
}
   ''', file = f)
sys.exit()
