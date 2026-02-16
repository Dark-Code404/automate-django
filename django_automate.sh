#!/bin/bash

path="$HOME/path/to/project/destination/"

project_name="$1"

if [[ -z "$project_name" ]]; then
    echo "Project name is empty."
    exit 1
fi

if ! command -v uv &> /dev/null; then
    echo "uv is not installed."
    exit 1
fi

if [[ -d "$path/$project_name" ]]; then
    echo "Project '$project_name' already exists at $path"
    exit 1
fi

mkdir -p "$path/$project_name"
cd "$path/$project_name" || exit

uv init
uv add django
uv run django-admin startproject "$project_name" .

read -p "Do you want to create an app? (y/n): " create_app
create_app=$(echo "$create_app" | tr '[:upper:]' '[:lower:]')

if [[ "$create_app" == "y" || "$create_app" == "yes" ]]; then
    read -r -p "Enter the app name: " app_name
    uv run python manage.py startapp "$app_name"
fi

read -p "Do you want to install Django REST Framework? (y/n): " install_drf
install_drf=$(echo "$install_drf" | tr '[:upper:]' '[:lower:]')

if [[ "$install_drf" == "y" || "$install_drf" == "yes" ]]; then
    uv add djangorestframework
    echo "Django REST Framework installed."
fi

read -p "Do you want to create a templates folder? (y/n): " create_templates
create_templates=$(echo "$create_templates" | tr '[:upper:]' '[:lower:]')

if [[ "$create_templates" == "y" || "$create_templates" == "yes" ]]; then
    mkdir templates
    touch templates/base.html
fi

if command -v code &> /dev/null; then
    code .
fi

echo "Project '$project_name' created successfully."

