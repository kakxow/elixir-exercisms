import sys
import subprocess
import os
import json


root_path = "/home/kakxow/snap/exercism/5/exercism/elixir"
cli_arguments = sys.argv
new_project_name = cli_arguments[3].split("=")[1]


def execute_and_change_dir():
    subprocess.run(cli_arguments[1:])
    path_to_new_project = f"{root_path}/{new_project_name}"
    os.chdir(path_to_new_project)


def change_project_dir():
    settings_path = root_path + "/elixir.code-workspace"
    with open(settings_path, encoding="utf-8") as f:
        settings = json.load(f)

    settings["settings"]["elixirLS.projectDir"] = new_project_name
    with open(settings_path, "w", encoding="utf-8") as f:
        json.dump(settings, f)


if __name__ == "__main__":
    execute_and_change_dir()
    change_project_dir()
    os.system("/bin/bash")