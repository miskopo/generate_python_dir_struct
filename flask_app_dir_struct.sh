#!/bin/zsh

[[ "$#" -ne 2 ]] && echo "Usage:zsh flask_app_dir_struct.sh PROJECT_NAME BASE_PATH" && exit;

# Project Name
PN="$1"
# Directory Name
DN="$2"

echo "Creating Flask Directory structure for project named $PN in directory $DN";

mkdir -p "$DN"/"$PN" "$DN"/"$PN"/app "$DN"/"$PN"/test "$DN"/"$PN"/logs "$DN"/"$PN"/docs &&
mkdir -p "$DN"/"$PN"/app/static "$DN"/"$PN"/app/templates  &&
touch "$DN"/"$PN"/README.md "$DN"/"$PN"/CHANGELOG.md "$DN"/"$PN"/install.sh "$DN"/"$PN"/requirements.txt && 
touch "$DN"/"$PN"/logs/.gitkeep "$DN"/"$PN"/docs/.gitkeep "$DN"/"$PN"/test/.gitkeep "$DN"/"$PN"/.gitignore "$DN"/"$PN"/app/static/.gitkeep "$DN"/"$PN"/app/templates/.gitkeep &&
touch "$DN"/"$PN"/app/__init__.py "$DN"/"$PN"/app/app.py  &&
echo "#!/usr/bin/env bash 
pip3 install -e . || pip3 install --user -e ." > "$DN"/"$PN"/install.sh &&
echo "api_key
.idea
.idea/
.idea/*
__pycache__
__pycache__/
__pycache__/*" > "$DN"/"$PN"/.gitignore

[[ $? -eq 0 ]] && echo "Directory structure created successfully"
