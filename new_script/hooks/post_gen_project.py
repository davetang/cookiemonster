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
