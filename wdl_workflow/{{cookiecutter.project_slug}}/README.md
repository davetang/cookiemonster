# {{ cookiecutter.project_name }}

{{ cookiecutter.project_short_description }}

Run workflow

    java -jar womtools.jar inputs {{ cookiecutter.workflow_name }}.wdl > {{cookiecutter.workflow_name}}.json
    java -jar cromwell.jar run {{ cookiecutter.workflow_name }}.wdl -i {{cookiecutter.workflow_name}}.json
