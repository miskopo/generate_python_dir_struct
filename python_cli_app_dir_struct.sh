#!/bin/sh

usage() {
	echo "Usage: python_cli_app_dir_struct.sh PROJECT_NAME BASE_PATH" && exit;
}

# Print usage if help flag or insufficient params are provided
[[ $1 = "-h" || $1 = "--help" ]] && usage
[[ "$#" -ne 2 ]] && usage

# Project Name
PN="$1"
# Directory Name
DN="$2"

echo "Creating Directory structure for project named $PN in directory $DN";

mkdir -p "$DN"/"$PN" "$DN"/"$PN"/"$PN" "$DN"/"$PN"/test "$DN"/"$PN"/logs "$DN"/"$PN"/docs &&
touch "$DN"/"$PN"/README.md "$DN"/"$PN"/CHANGELOG.md "$DN"/"$PN"/install.sh "$DN"/"$PN"/requirements.txt "$DN"/"$PN"/setup.py && 
touch "$DN"/"$PN"/logs/.gitkeep "$DN"/"$PN"/docs/.gitkeep "$DN"/"$PN"/test/.gitkeep "$DN"/"$PN"/.gitignore &&
touch "$DN"/"$PN"/"$PN"/__init__.py "$DN"/"$PN"/"$PN"/__main__.py  &&
echo "from setuptools import setup\n
setup(
    name='$PN',
    version='0.0.1',
    packages=['$PN'],
    entry_points={
        'console_scripts': [
            '$PN = $PN.__main__:main'
         ]
    })" > "$DN"/"$PN"/setup.py &&
echo "#!/usr/bin/env bash 
pip3 install -e . || pip3 install --user -e ." > "$DN"/"$PN"/install.sh &&
echo "api_key
.idea
.idea/
.idea/*
__pycache__
__pycache__/
__pycache__/*" > "$DN"/"$PN"/.gitignore

[[ $? -eq 0 ]] && echo "Directory structure created successfully" || { echo "There was an error creating repository structure" >&2; exit 1; }
