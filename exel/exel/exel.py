from re import sub
import sys
import subprocess
import os
import json


root_path = "/home/kakxow/snap/exercism/5/exercism/elixir"
cli_arguments = sys.argv


def execute_and_change_dir(new_project_name):
    subprocess.run(cli_arguments[1:])
    path_to_new_project = f"{root_path}/{new_project_name}"
    os.chdir(path_to_new_project)


def change_project_dir(new_project_name):
    settings_path = root_path + "/.vscode/settings.json"
    with open(settings_path, encoding="utf-8") as f:
        settings = json.load(f)

    settings["elixirLS.projectDir"] = new_project_name
    with open(settings_path, "w", encoding="utf-8") as f:
        json.dump(settings, f)


def add_commit():
    os.chdir(root_path)
    process = subprocess.run("git status -s".split(),stdout=subprocess.PIPE, text=True)
    for line in process.stdout.split("\n"):
        if line.startswith("??"):
            new_dir_name = line[3:-1]
            subprocess.run("git add -A".split())
            subprocess.run(f"git commit -m \"{new_dir_name}\"".split())
            break


def main():
    add_commit()
    new_project_name = cli_arguments[3].split("=")[1]
    execute_and_change_dir(new_project_name)
    change_project_dir(new_project_name)
    os.system("/bin/bash")

if __name__ == "__main__":
    main()